module Mutations
  class CreateVideoGame < BaseMutation
    def ready?(**args)
      if !context[:current_user].admin
        raise GraphQL::ExecutionError, "You are not authorized!"
      else
        true
      end
    end

    argument :attributes, Types::VideoGameAttributes, required: true

    field :video_game, Types::VideoGameType, null: false
    field :errors, [String], null: false

    def resolve(attributes:)
      video_game = VideoGame.new(attributes.to_h)
      if(video_game.save)
        {
        video_game: video_game,
        errors: []
        }
      else
        {
        errors: video_game.errors.full_messages
        }
      end
    end
  end
end