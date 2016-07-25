require 'rails_helper'

RSpec.describe "restos/new", type: :view do
  before(:each) do
    assign(:resto, Resto.new(
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new resto form" do
    render

    assert_select "form[action=?][method=?]", restos_path, "post" do

      assert_select "input#resto_name[name=?]", "resto[name]"

      assert_select "input#resto_address[name=?]", "resto[address]"

      assert_select "input#resto_latitude[name=?]", "resto[latitude]"

      assert_select "input#resto_longitude[name=?]", "resto[longitude]"
    end
  end
end
