require "rspec"
require "support/runner"
require "support/matcher"

Rspec.configure do |config|
  config.include Spec::BeardRunner
  config.include Spec::BeardMatchers

  include Spec::BeardRunner

  original_wd = Dir.pwd
  wipe_tmp
  Dir.chdir(root)

  generate_beard("original")

  config.before do
    wipe_tmp("temp_app")
    Dir.chdir(root)
    FileUtils.cp_r("original", "temp_app")
  end

  config.after do
    Dir.chdir(original_wd)
  end
end