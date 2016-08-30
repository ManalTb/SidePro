
describe Rating do
  let(:user) { create :user }
  let(:snack) { create :snack }
  context "user can rate" do
    it "rates a snack" do
      expect(build(:rating, user: user, snack: snack).valid?).to eq true
    end
  end
  context "user already rated the snack" do
    it "does not create the second rating" do
      rating = create(:rating)
      expect(build(:rating, user: rating.user, snack: rating.snack).valid?).to eq false
    end
  end
end
