FactoryGirl.define do
  factory :rating do
      mark 3
      snack #belongs_to rating
      user #belongs_to rating
  end

FactoryGirl.define do
  factory :snack do
    brand "La Tour d'Argent"
    adress "15 Quai de la Tournelle, France"
    category #belongs_to category
  end
end

FactoryGirl.define do
  factory :category do
    name "gastronomie"
  end
end
end
