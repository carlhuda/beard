module Beard
  module Generator
    def source_root
      File.expand_path("../#{generator_name}/templates", __FILE__)
    end
  end
end
