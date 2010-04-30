require "pathname"

module Spec
  module BeardRunner
    def beard_root
      Pathname.new(File.expand_path("../../..", __FILE__))
    end

    def root
      beard_root.join("tmp")
    end

    def wipe_tmp
      FileUtils.rm_rf(root)
      FileUtils.mkdir_p(root)
    end

    def generate_beard
      beard_builder = beard_root.join("lib/beard/app_builder.rb")
      system "rails temp_app -b #{beard_root}"
    end
  end
end