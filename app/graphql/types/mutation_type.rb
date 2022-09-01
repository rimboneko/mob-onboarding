module Types
  class MutationType < Types::BaseObject
    field :create_video_game, mutation: Mutations::CreateVideoGame
  end
end
