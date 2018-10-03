require 'rails_helper'

RSpec.describe "testings/edit", type: :view do
  before(:each) do
    @testing = assign(:testing, Testing.create!(
      :name => "MyString",
      :price => 1,
      :description => "MyText",
      :postcode => 1.5
    ))
  end

  it "renders the edit testing form" do
    render

    assert_select "form[action=?][method=?]", testing_path(@testing), "post" do

      assert_select "input[name=?]", "testing[name]"

      assert_select "input[name=?]", "testing[price]"

      assert_select "textarea[name=?]", "testing[description]"

      assert_select "input[name=?]", "testing[postcode]"
    end
  end
end
