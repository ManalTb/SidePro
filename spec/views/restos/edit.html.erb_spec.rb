require 'rails_helper'

RSpec.describe "restos/edit", type: :view do
  before(:each) do
    @resto = assign(:resto, Resto.create!(
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit resto form" do
    render

    assert_select "form[action=?][method=?]", resto_path(@resto), "post" do

      assert_select "input#resto_name[name=?]", "resto[name]"

      assert_select "input#resto_address[name=?]", "resto[address]"

      assert_select "input#resto_latitude[name=?]", "resto[latitude]"

      assert_select "input#resto_longitude[name=?]", "resto[longitude]"
    end
  end
end
