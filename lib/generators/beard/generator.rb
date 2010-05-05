# Hide the namespaces for Rails generators we aren't using,
# as well as generators that we already used during the
# install process
Rails::Generators.hide_namespaces(
  :erb,
  :test_unit,
  :beard,
  :devise,
  :devise_install,
  :devise_views,
  "rspec:install"
)

module Beard
  module Generator
    def source_root
      File.expand_path("../#{generator_name}/templates", __FILE__)
    end
  end
end
