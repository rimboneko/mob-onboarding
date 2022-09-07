class User < ApplicationRecord
  has_many :libraries
  has_many :video_games, through: :libraries
end
