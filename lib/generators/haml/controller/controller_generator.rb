require 'generators/haml/generator'
require 'rails/generators/erb/controller/controller_generator'

module Haml
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      extend Haml::Generator
    end
  end
end