module Mutations
  class DeleteVideoGame < BaseMutation
    def ready?(**args)
      if !context[:current_user].admin
        raise GraphQL::ExecutionError, "You are not authorized!"
      else
        true
      end
    end

    field :message, String, null: true
    field :errors, [String], null:true

    argument :id, ID, required: true

    def resolve(id:)
      video_game = VideoGame.find(id)
      if video_game.destroy
        {
        message: "successfully delete",
        errors: []
        }
      else
        {errors: video_game.errors.full_messages}
      end
    end
  end
end
