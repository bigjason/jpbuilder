require "jbuilder"

class JPbuilderHandler
  cattr_accessor :default_format, :default_callback
  self.default_format = Mime::JSON
  self.default_callback = nil

  def self.call(template)
    %{
      if defined?(json)
        #{template.source}
      else
        result = JbuilderTemplate.encode(self) do |json|
          #{template.source}
        end
        callback = params[:callback] || JPbuilderHandler.default_callback
        if callback.present?
          "\#{callback}(\#{result});"
        else
          result
        end
      end
    }
  end
end

ActionView::Template.register_template_handler :jpbuilder, JPbuilderHandler
