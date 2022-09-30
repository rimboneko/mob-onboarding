module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :video_games, [Types::VideoGameType], null: false
    def video_games
      VideoGame.all
    end

    field :video_game, Types::VideoGameType, null: false do
      argument :id, ID, required: true
    end
    def video_game(id:)
      VideoGame.find(id)
    end

    field :my_library, [Types::VideoGameType], null: true
    def my_library
      context[:current_user].video_games
    end
  end
end
