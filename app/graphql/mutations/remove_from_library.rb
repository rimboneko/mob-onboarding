module Mutations
  class RemoveFromLibrary < BaseMutation
    field :message, String, null: true
    field :errors, [String], null:true

    argument :id, ID, required: true

    def resolve(id:)
      video_game_library = Library.where(user: context[:current_user], video_game: VideoGame.find(id))
      if video_game_library.first.destroy
        {
          message: "successfully removed",
          errors: []
        }
      else
        {errors: Library.errors.full_messages}
      end
    end
  end
end
