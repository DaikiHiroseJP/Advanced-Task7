class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users

  validates :name, presence: true
  validates :outline, presence: true
  has_one_attached :team_image
end
