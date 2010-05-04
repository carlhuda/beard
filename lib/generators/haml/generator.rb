module Haml
  module Generator
    def source_root
      File.expand_path("../#{generator_name}/templates", __FILE__)
    end

    def self.extended(klass)
      klass.class_eval { def handler() :haml end }
    end
  end
end
