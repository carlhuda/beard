require "pathname"

module Spec
  module BeardRunner
    def beard_root
      Pathname.new(File.expand_path("../../..", __FILE__))
    end

    def root
      beard_root.join("tmp")
    end

    def wipe_tmp(path = "")
      FileUtils.rm_rf(root.join(path))
      FileUtils.mkdir_p(root)
    end

    def app
      root.join("temp_app")
    end

    def run_command(*args)
      open_without_dm(*args)
    end

    def open_without_dm(command, should_output = true)
      output = ""

      IO.popen(command) do |io|
        while string = io.gets
          next if string =~ /^\[datamapper\]/

          if block_given?
            yield string
          elsif should_output
            puts string
          end
          output << string
        end
      end

      output
    end

    def generate_beard(location = "temp_app")
      beard_builder = beard_root.join("lib/beard/app_builder.rb")
      system "rails #{location} -b #{beard_builder}"
    end
  end
end