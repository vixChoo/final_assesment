require 'rails_helper'

RSpec.describe "testings/index", type: :view do
  before(:each) do
    assign(:testings, [
      Testing.create!(
        :name => "Name",
        :price => 2,
        :description => "MyText",
        :postcode => 3.5
      ),
      Testing.create!(
        :name => "Name",
        :price => 2,
        :description => "MyText",
        :postcode => 3.5
      )
    ])
  end

  it "renders a list of testings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
