class Library < ApplicationRecord
  belongs_to :user
  belongs_to :video_game
end
