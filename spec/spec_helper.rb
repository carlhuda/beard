require "rspec"
require "support/runner"

Rspec.configure do |config|
  config.include Spec::BeardRunner

  original_wd = Dir.pwd
  
  config.before do
    Dir.chdir(root)
  end
  
  config.after do
    Dir.chdir(original_wd)
  end
end