module SnacksHelper
  def update_rating_btn(user, snack)
    if current_user
      Rating.where(user_id: current_user.id, snack_id: snack).exists?
    end
  end
end
