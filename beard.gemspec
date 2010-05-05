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

  s.add_dependency "railties",       "3.0.0.beta3"
  s.add_dependency "actionpack",     "3.0.0.beta3"
  s.add_dependency "actionmailer",   "3.0.0.beta3"
  s.add_dependency "astaire",        "0.2.0"
  s.add_dependency "rspec-rails",    "2.0.0.beta.8"
  s.add_dependency "capybara",       "0.3.7"
  s.add_dependency "haml",           "3.0.0.rc.2"
  s.add_dependency "dm-rails",       "0.10.2"
  s.add_dependency "dm-validations", "0.10.3"
  s.add_dependency "mail_form",      "1.2.1"
  s.add_dependency "devise",         "1.1.rc1"
  s.add_dependency "will_paginate",  "3.0.pre"

  # depend on dm-migrations because dm-rails forgot to
  s.add_dependency "dm-migrations", "0.10.3"

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.require_path = 'lib'
end