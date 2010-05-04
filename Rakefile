task :spec do
  require "rspec"

  $:.unshift File.expand_path("../lib", __FILE__)
  $:.unshift File.expand_path("../spec", __FILE__)
  require "rubygems"
  require "pp"

  Dir["#{File.expand_path("..", __FILE__)}/spec/**/*_spec.rb"].each do |file|
    require file
  end
end