ENV["BUNDLE_GEMFILE"] = nil
ENV["BUNDLE_PATH"] = nil
ENV["RUBYOPT"] = nil

class AppBuilder < Rails::AppBuilder
  def gemfile
    create_file "Gemfile", <<-G.gsub(/^ {6}/, '')
      source "http://rubygems.org"
      git "http://github.com/datamapper/dm-rails.git"
      git "http://github.com/datamapper/dm-core.git"
      git "http://github.com/datamapper/dm-active_model.git"
      git "http://github.com/datamapper/dm-sqlite-adapter.git"
      git "http://github.com/datamapper/dm-do-adapter.git"
      git "http://github.com/rspec/rspec-rails.git"
      git "git://github.com/rails/rails.git"

      gem "beard", :path => "~/Code/beard"
      gem "dm-sqlite-adapter"
    G

    say_status :installing, "beard dependencies"
    puts
    puts "--- fetching beard dependencies into #{Dir.pwd} ---"

    system "bundle install"
    puts "--- done fetching and installing ---"
    puts
  end

  def app
    directory "app/controllers"
    directory "app/helpers"
    directory "app/models"
    create_file "app/views/layouts/application.html.haml", <<-H.gsub(/^ {6}/, '')
      !!!5
      %html
        %head
          %title= #{app_const_base}
          = stylesheet_link_tag :all
          = javascript_include_tag :defaults
          = csrf_meta_tag

        %body
          = yield
    H
  end

  def javascripts
    create_file "public/javascripts/rails.js",  open("http://github.com/rails/jquery-ujs/raw/master/src/rails.js") {|io| io.read}
    create_file "public/javascripts/jquery.js", open("http://code.jquery.com/jquery-1.4.2.min.js") {|io| io.read }
  end

  def leftovers
    IO.popen("ruby script/rails g rspec:install") do |io|
      while string = io.gets
        puts string unless string =~ /^\[datamapper\]/
      end
    end
  end

  undef :test
  undef :vendor_plugins

private
  def say_status(*args)
    @generator.say_status(*args)
  end

  def app_const_base(*args)
    @generator.send(:app_const_base, *args)
  end
end