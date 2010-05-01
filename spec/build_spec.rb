require "spec_helper"

describe "generating a Rails app with the beard builder" do
  it "has the generated files" do
    app.should have_structure {
      file ".gitignore"
      file "Gemfile" do
        contains %{gem "beard"}
        contains %{gem "dm-sqlite-adapter"}
      end

      file "Rakefile"

      directory "autotest" do
        file "discover.rb"
      end

      file "config.ru"
      directory "doc"
      directory "log"
      directory "script"

      directory "tmp" do
        directory "cache"
        directory "pids"
        directory "sessions"
        directory "sockets"
      end

      directory "app" do
        directory "models"

        directory "controllers" do
          file "application_controller.rb"
        end

        directory "helpers" do
          file "application_helper.rb"
        end

        directory "views" do
          directory "layouts" do
            file "application.html.haml"
          end
        end
      end

      directory "config" do
        file "application.rb"
        file "boot.rb"
        file "environment.rb"

        directory "environments" do
          file "development.rb"
          file "production.rb"
          file "test.rb"
        end

        directory "initializers"

        directory "locales" do
          file "en.yml"
        end

        file "routes.rb"
        file "database.yml"
      end

      directory "db" do
        file "seeds.rb"
      end

      directory "lib"

      directory "public" do
        directory "javascripts" do
          file "jquery.js"
          file "rails.js" do
            contains "jQuery"
          end
        end

        directory "stylesheets"
        directory "images"

        file "index.html"
        file "500.html"
        file "404.html"
        file "422.html"
        file "robots.txt"
        file "favicon.ico"
      end
      
      directory "spec" do
        file "spec_helper.rb"
      end
    }
  end
end