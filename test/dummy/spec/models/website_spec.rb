require 'spec_helper'

describe Website do
  it "should has one my history value" do
    site = FactoryGirl.build(:website)
    site.save!
    site.my_histories.size.should eq(1)
    100.times do
      site.update_attributes(FactoryGirl.attributes_for(:website))
      site.save!
    end
    site.reload
    site.my_histories.size.should eq(101)

  end

  it { should have_many(:my_histories) }

end
