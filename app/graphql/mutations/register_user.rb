module Mutations
  class RegisterUser < BaseMutation
    argument :email, String,required: true
    argument :password, String, required: true

    field :message, String, null: false
    field :errors, [String], null: true

    def resolve(email:, password:)
      user = User.new(email: email, password: password)
      if user.save
        {
          message: "User registered",
          errors: []
        }
      else
        {
          errors: user.errors.full_messages
        }
      end
    end
  end
end
