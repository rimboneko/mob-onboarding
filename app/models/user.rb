class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :libraries
  has_many :video_games, through: :libraries
end
