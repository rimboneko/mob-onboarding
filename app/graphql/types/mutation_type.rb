module Types
  class MutationType < Types::BaseObject
    field :login_user, mutation: Mutations::LoginUser
    field :register_user, mutation: Mutations::RegisterUser
    field :remove_from_library, mutation: Mutations::RemoveFromLibrary
    field :add_to_library, mutation: Mutations::AddToLibrary
    field :delete_video_game, mutation: Mutations::DeleteVideoGame
    field :update_video_game, mutation: Mutations::UpdateVideoGame
    field :create_video_game, mutation: Mutations::CreateVideoGame
  end
end
