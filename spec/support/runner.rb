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

    def with_clean_env
      gemfile, ENV["BUNDLE_GEMFILE"] = ENV["BUNDLE_GEMFILE"], nil
      path, ENV["BUNDLE_PATH"]       = ENV["BUNDLE_PATH"], nil
      opt, ENV["RUBYOPT"]            = ENV["RUBYOPT"], nil
      yield
    ensure
      ENV["BUNDLE_GEMFILE"] = gemfile
      ENV["BUNDLE_PATH"] = path
      ENV["RUBYOPT"] = opt
    end

    def run_command(*args)
      with_clean_env { open_without_dm(*args) }
    end

    def open_without_dm(*args)
      IO.popen(*args) do |io|
        while string = io.gets
          puts string unless string =~ /^\[datamapper\]/
        end
      end
    end

    def generate_beard(location = "temp_app")
      beard_builder = beard_root.join("lib/beard/app_builder.rb")
      system "rails #{location} -b #{beard_builder}"
    end
  end
end