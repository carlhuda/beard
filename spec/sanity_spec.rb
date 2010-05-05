require "spec_helper"

describe "An app after beard generation" do
  it "boots" do
    out = run_command("script/rails runner 'puts Rails.root'", false)
    out.should =~ %r{beard/tmp/temp_app}
  end
end