module Types
  class VideoGameAttributes < Types::BaseInputObject
    description "Attributes for creating or updating a video game"
    argument :title, String, required: true
    argument :platform, String, required: true
    argument :genre, String, required: true
    argument :rating, String, required: false
  end
end
