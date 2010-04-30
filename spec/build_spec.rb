require "spec_helper"

describe "generating a Rails app with the beard builder" do
  before do
    wipe_tmp
    generate_beard
  end
  
  it "is true" do
    true.should == true
  end
end