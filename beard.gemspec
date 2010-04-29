Gem::Specification.new do |s|
  s.name        = "beard"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carl Lerche", "Yehuda Katz"]
  s.email       = ["carlhuda@engineyard.com"]
  s.homepage    = "http://github.com/carlhuda/beard"
  s.summary     = "Rails' evil twin (with a beard)"
  s.description = "The basic rails stack customized with our favorite gems."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "beard"

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.require_path = 'lib'
end