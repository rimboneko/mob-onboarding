module Mutations
  class CreateVideoGame < BaseMutation
    argument :title, String, required: true
    argument :platform, String, required: true
    argument :genre, String, required: true
    argument :rating, String, required: false

    field :video_game, Types::VideoGameType, null:false
    field :errors, [String], null:false

    def resolve(title:, platform:, genre:, rating:)
      video_game = VideoGame.new(title: title, platform: platform, genre: genre, rating: rating)
      if(video_game.save)
        {
        video_game: video_game,
        errors: []
        }
      else
        {
        user: nil,
        errors: video_game.errors.full_messages
        }
      end
    end
  end
end