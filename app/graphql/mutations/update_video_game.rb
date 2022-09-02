module Mutations
  class UpdateVideoGame < BaseMutation
    field :video_game, Types::VideoGameType, null: true
    field :errors, [String], null: true

    argument :attributes, Types::VideoGameAttributes, required: true
    argument :id, ID, required: true

    def resolve(id:, attributes:)
      video_game = VideoGame.find(id)
      if video_game.update(attributes.to_h)
        {
          video_game: video_game,
          errors: []
        }
      else
        {errors: video_game.errors.full_messages}
      end
    end
  end
end
