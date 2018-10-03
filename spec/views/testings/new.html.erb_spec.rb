require 'rails_helper'

RSpec.describe "testings/new", type: :view do
  before(:each) do
    assign(:testing, Testing.new(
      :name => "MyString",
      :price => 1,
      :description => "MyText",
      :postcode => 1.5
    ))
  end

  it "renders new testing form" do
    render

    assert_select "form[action=?][method=?]", testings_path, "post" do

      assert_select "input[name=?]", "testing[name]"

      assert_select "input[name=?]", "testing[price]"

      assert_select "textarea[name=?]", "testing[description]"

      assert_select "input[name=?]", "testing[postcode]"
    end
  end
end
