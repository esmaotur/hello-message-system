class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :message
  
  validates :reaction_type, presence: true
  validates :user_id, uniqueness: { scope: :message_id }
end
