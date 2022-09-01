# frozen_string_literal: true

module Types
  class VideoGameType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :platform, String
    field :genre, String
    field :rating, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
