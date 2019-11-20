require "jbuilder"

class JPbuilderHandler
  cattr_accessor :default_format, :default_callback
  
  def initialize
    self.default_callback = nil
    self.default_format = (Rails.version < '6.0.0') ? Mime[:json] : :json 
  end

  def self.call(template, source=nil)
    source =|| template.source
    %{
      if defined?(json)
        #{source}
      else
        result = JbuilderTemplate.encode(self) do |json|
          #{source}
        end
        result = result.each_char.to_a.map { |chr| chr.ord > 1000 ? "\\\\u\#{"%4.4x" % chr.ord}" : chr }.join
        callback = params[:callback] || JPbuilderHandler.default_callback
        if callback.present?
          "/**/\#{callback}(\#{result});"
        else
          result
        end
      end
    }
  end
end

ActionView::Template.register_template_handler :jpbuilder, JPbuilderHandler
