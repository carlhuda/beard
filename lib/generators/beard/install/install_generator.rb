require "generators/beard/generator"

module Beard
  class InstallGenerator < Rails::Generators::Base
    extend Beard::Generator

    def welcome_controller
      system "script/rails g controller welcome index"
    end

    def helpers
      directory "app", "app", :verbose => false
    end

    def root_to_welcome
      route %{root :to => "welcome#index"}
    end
  end
end