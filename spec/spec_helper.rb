require "rubygems"
require "rspec"
require "support/runner"
require "support/matcher"
require "fileutils"

ENV["BEARD_DEV"] = "1"

Rspec.configure do |config|
  config.include Spec::BeardRunner
  config.include Spec::BeardMatchers

  include Spec::BeardRunner

  original_wd = File.expand_path(Dir.pwd)
  wipe_tmp

  Dir.chdir(root)
  generate_beard("original")
  Dir.chdir(original_wd)

  config.before do
    wipe_tmp("temp_app")
    Dir.chdir(root)
    FileUtils.cp_r("original", "temp_app")
    Dir.chdir(app)
  end

  config.after do
    Dir.chdir(original_wd)
  end
end