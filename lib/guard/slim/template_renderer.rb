module Guard
  class Slim < Plugin
    class TemplateRenderer
      # Initializes a template renderer
      #
      # @param [Template] template
      #
      def initialize(template)
        @template = template
      end

      # Renders slim template into html code
      #
      # @param [Class] context_class
      # @param [Hash] slim_options
      #
      # @return [String]
      #   rendered html output
      #
      def render(context_class, slim_options)
        context = context_class.new(@template)

        ::Slim::Template.new(slim_options) { source }.render(context)
      rescue Exception => exception
        UI.info exception.message
      end

      private

      # Reads template source
      #
      # @return [String]
      #   template source
      #
      def source
        File.read(@template.path)
      end
    end
  end
end
