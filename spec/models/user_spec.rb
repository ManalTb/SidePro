
describe User do
  let(:user){ build(:user) }
  it "builds without errors" do
    expect(user).to be_valid
  end
  it "creates ok" do
    expect{user.save}.to change{User.count}.by(1)
  end
end
