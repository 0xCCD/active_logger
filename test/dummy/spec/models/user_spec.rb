require 'spec_helper'

describe User do

  it "should has one my history value" do
    user = FactoryGirl.build(:user)
    user.save!
    user.my_histories.size.should eq(1)
    100.times do
      _attributes = FactoryGirl.attributes_for(:user)
      user.update_attributes(_attributes)
      user.save!
    end
    user.reload
    user.my_histories.size.should eq(101)
  end

  it { should have_many(:my_histories) }

end
