require "guard"
require "guard/guard"
require "guard/watcher"
require "slim"
require "fileutils"

module Guard
  class Slim < Guard
    NullContext = Struct.new(:template)

    DEFAULTS = {
      :all_on_start => false,
      :input        => "templates",
      :output       => "public",
      :context      => nil,
      :slim_options => {}
    }.freeze

    # Initializes a Guard plugin
    #
    # @param [Array<Guard::Watcher>] watchers
    #   the plugin file watchers
    # @param [Hash] options
    #   the plugin options
    #
    def initialize(watchers = [], options = {})
      options = DEFAULTS.merge(options)
      super(watchers, options)
    end

    # Called once when Guard starts
    #
    def start
      run_all if @options[:all_on_start]
    end

    # Called when just `enter` is pressed
    #
    def run_all
      run_on_changes(Watcher.match_files(self, Dir.glob(File.join('**', '*.*'))))
    end

    # @param [Array<String>] paths
    #   the changed files or paths
    #
    def run_on_changes(paths)
      paths.each { |path| compile(path) }
    end

    def context
      @options[:context] || NullContext
    end

    private

    def compile(path)
      content = render(path)
      output_path = output_path(path)

      File.open(output_path, "w") do |file|
        file.puts(content)
      end

      UI.info "Guard::Slim: Rendered #{path} to #{output_path}"
    end

    def render(input_path)
      template = Template.new(input_path)
      TemplateRenderer.new(template).render(context, @options[:slim_options])
    end

    def output_path(input_path)
      path    = File.expand_path(input_path).sub(@options[:input], @options[:output])
      dirname = File.dirname(path)

      FileUtils.mkpath(dirname) unless File.directory?(dirname)

      basename = File.basename(path, '.slim')
      basename << '.html' if File.extname(basename).empty?

      File.join(dirname, basename)
    end
  end
end

require "guard/slim/template"
require "guard/slim/template_renderer"
