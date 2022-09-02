module Types
  class MutationType < Types::BaseObject
    field :delete_video_game, mutation: Mutations::DeleteVideoGame
    field :update_video_game, mutation: Mutations::UpdateVideoGame
    field :create_video_game, mutation: Mutations::CreateVideoGame
  end
end
