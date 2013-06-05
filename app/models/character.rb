class Character < ActiveRecord::Base
  before_validation :set_starting_hp
  validates :current_hp, numericality: { less_than_or_equal_to: :max_hp, message: 'cannot exceed max hp' }

  def modify_hp(decrement = true)
    if decrement
      self.current_hp -= 1
    else
      self.current_hp += 1
    end
  end

  private

  def set_starting_hp
    if new_record?
      self.current_hp = max_hp
    end
  end
end
