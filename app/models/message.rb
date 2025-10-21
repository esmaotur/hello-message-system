class Message < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :conversation
  has_many :reactions, dependent: :destroy
  
  validates :content, presence: true
end
