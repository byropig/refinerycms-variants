require 'spec_helper'

describe Variant do

  def reset_variant(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @variant.destroy! if @variant
    @variant = Variant.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_variant
  end

  context "validations" do
    
    it "rejects empty name" do
      Variant.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_variant
      Variant.new(@valid_attributes).should_not be_valid
    end
    
  end

end