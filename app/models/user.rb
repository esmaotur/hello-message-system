class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :conversations, through: :messages
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end