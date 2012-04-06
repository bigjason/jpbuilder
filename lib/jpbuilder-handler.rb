require "jbuilder"

class JPbuilderHandler
  cattr_accessor :default_format
  self.default_format = Mime::JSON

  def self.call(template)
    %{
      if defined?(json)
        #{template.source}
      else
        result = JbuilderTemplate.encode(self) do |json|
          #{template.source}
        end
        if callback = params[:callback]
          "\#{callback}(\#{result});"
        else
          result
        end
      end
    }
  end
end

ActionView::Template.register_template_handler :jpbuilder, JPbuilderHandler
