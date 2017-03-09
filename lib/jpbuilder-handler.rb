require "jbuilder"

class JPbuilderHandler
  cattr_accessor :default_format, :default_callback
  self.default_format = Mime[:json]
  self.default_callback = nil

  def self.call(template)
    %{
      if defined?(json)
        #{template.source}
      else
        result = JbuilderTemplate.encode(self) do |json|
          #{template.source}
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
