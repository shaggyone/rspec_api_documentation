require "active_support/core_ext/enumerable"

module RspecApiDocumentation
  module Writers
    module IndexHelper
      def sections(examples, configuration)
        resources = examples.group_by(&:resource_name).inject([]) do |arr, (resource_name, examples)|
          grouped_examples = examples.group_by(&:full_route).map { |full_route, examples| { full_route: full_route, examples: examples } }
          arr.push(:resource_name => resource_name, :requests => grouped_examples)
        end
        configuration.keep_source_order ? resources : resources.sort_by { |resource| resource[:resource_name] }
      end
      module_function :sections
    end
  end
end
