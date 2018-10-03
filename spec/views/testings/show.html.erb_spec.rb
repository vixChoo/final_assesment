require 'rails_helper'

RSpec.describe "testings/show", type: :view do
  before(:each) do
    @testing = assign(:testing, Testing.create!(
      :name => "Name",
      :price => 2,
      :description => "MyText",
      :postcode => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3.5/)
  end
end
