class Rating < ActiveRecord::Base
  belongs_to :snack
  belongs_to :user

  validates :mark,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }

  validates :user, :snack,
    presence: true

  validates :user_id,
    uniqueness: { scope: :snack_id }

end
