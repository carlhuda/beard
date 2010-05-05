require "generators/beard/generator"

module Beard
  class InstallGenerator < Rails::Generators::Base
    extend Beard::Generator

    def install_dependencies
      say_status :installing, "rspec", :white
      with_padding do
        invoke "rspec:install"
        gsub_file("config/initializers/rspec_generator.rb",
                  /^/, "#  ", :verbose => false)
      end

      say_status :installing, "devise", :white
      with_padding do
        invoke "devise_install"
        say_status :replacing, "ActiveRecord with DataMapper in initializers/devise.rb"
        gsub_file("config/initializers/devise.rb",
                  %r{'devise/orm/active_record'},
                  %{'devise/orm/data_mapper'},
                  :verbose => false)
      end
    end

    def welcome_controller
      say_status :creating, "welcome controller", :white
      with_padding do
        invoke "controller", %w(welcome index)
      end
    end

    def helpers
      directory "app", "app", :verbose => false
    end

    def root_to_welcome
      route %{root :to => "welcome#index"}
    end

    def user_model
      say_status :creating, "User model", :white
      with_padding { invoke "devise", %w(user) }
    end
  end
end