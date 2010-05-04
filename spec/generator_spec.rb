require "spec_helper"

describe "using the packaged mail_form generator" do
  it "creates a file in the app/models/directory" do
    run_command "script/rails g mail_form ContactForm"

    app.should have_structure {
      directory "app" do
        directory "models" do
          file "contact_form.rb" do
            contains "attribute :email"
            contains "def headers"
          end
        end
      end
    }
  end
end

describe "using the packaged haml generator" do
  it "creates normal controllery stuff" do
    run_command "script/rails g controller users index"

    app.should have_structure {
      directory "app" do
        directory "controllers" do
          file "users_controller.rb" do
            contains "class UsersController < ApplicationController"
          end
        end
      end

      # It should pull in the default rspec stubs
      directory "spec" do
        directory "controllers" do
          file "users_controller_spec.rb" do
            contains "describe UsersController do"
          end
        end
      end
    }
  end
end