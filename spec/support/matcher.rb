module Spec
  module BeardMatchers
    class File
      def initialize(name, &block)
        @contents = []
        @name = name

        if block_given?
          instance_eval(&block)
        end
      end

      def contains(text)
        @contents << text
      end

      def matches?(root)
        unless root.join(@name).exist?
          throw :failure, root.join(@name)
        end

        contents = ::File.read(root.join(@name))

        @contents.each do |string|
          unless contents.include?(string)
            throw :failure, [root.join(@name), string, contents]
          end
        end
      end
    end

    class Directory
      attr_reader :tree

      def initialize(root = nil, &block)
        @tree = {}
        @negative_tree = []
        @root = root
        instance_eval(&block) if block_given?
      end

      def directory(name, &block)
        @tree[name] = block_given? && Directory.new(location(name), &block)
      end

      def file(name, &block)
        @tree[name] = File.new(location(name), &block)
      end

      def no_file(name)
        @negative_tree << name
      end

      def location(name)
        [@root, name].compact.join("/")
      end

      def matches?(root)
        @tree.each do |file, value|
          unless value
            unless root.join(location(file)).exist?
              throw :failure, "#{root}/#{location(file)}"
            end
          else
            value.matches?(root)
          end
        end

        @negative_tree.each do |file|
          if root.join(location(file)).exist?
            throw :failure, [:not, "unexpected #{root}/#{location(file)}"]
          end
        end

        nil
      end
    end

    class Root < Directory
      def failure_message
        if @failure.is_a?(Array) && @failure[0] == :not
          "Structure should not have had #{@failure[1]}, but it did"
        elsif @failure.is_a?(Array)
          "Structure should have #{@failure[0]} with #{@failure[1]}. It had:\n#{@failure[2]}"
        else
          "Structure should have #{@failure}, but it didn't"
        end
      end

      def matches?(root)
        @failure = catch :failure do
          super
        end

        !@failure
      end
    end

    def have_structure(&block)
      Root.new(&block)
    end
  end
end