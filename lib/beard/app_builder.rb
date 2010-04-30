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

      gem "beard", :path => "~/Developer/Source/beard"
      gem "dm-sqlite-adapter"
    G
  end

  def javascripts
    create_file "public/javascripts/rails.js",  open("http://github.com/rails/jquery-ujs/raw/master/src/rails.js") {|io| io.read}
    create_file "public/javascripts/jquery.js", open("http://code.jquery.com/jquery-1.4.2.min.js") {|io| io.read }
  end

  def test
    empty_directory "spec"

    inside "spec" do
      create_file "spec_helper.rb", open("http://github.com/rspec/rspec-rails/raw/master/lib/generators/rspec/install/templates/spec/spec_helper.rb") {|io| io.read }
    end

    empty_directory "autotest"

    inside "autotest" do
      create_file "discover.rb", open("http://github.com/rspec/rspec-rails/raw/master/lib/generators/rspec/install/templates/autotest/discover.rb") {|io| io.read }
    end
  end

  undef :vendor_plugins
end