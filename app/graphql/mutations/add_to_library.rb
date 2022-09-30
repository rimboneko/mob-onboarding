module Mutations
  class AddToLibrary < BaseMutation
    field :message, String, null: true
    field :errors, [String], null:true

    argument :id, ID, required: true

    def resolve(id:)
      video_game = VideoGame.find(id)
      user = context[:current_user]
      if Library.create(user: user, video_game: video_game)
        {
          message: "Video Game added! to ",
          errors: []
        }
      else
        {errors: Library.errors.full_messages}
      end
    end
  end
end
