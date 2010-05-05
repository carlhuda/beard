require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'dm-rails'
require 'rspec-rails'
require 'devise'
require 'haml'

module Beard
  class Railtie < ::Rails::Railtie
    config.generators.template_engine :haml
  end
end