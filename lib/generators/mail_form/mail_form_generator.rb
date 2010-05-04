class MailFormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  class_option :attributes, :type => :array, :default => []

  def create_mail_form
    options[:attributes].concat([:email]).uniq!
    template "mail_form.rb.tt", "app/models/#{file_name}.rb"
  end
end