module Mutations
  class LoginUser < BaseMutation
    #include JsonWebToken

    argument :email, String,required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :errors, [String], null: true

    def resolve(email:, password:)
      user = User.find_by_email(email)
      if user&.authenticate(password)
        {
          token: JsonWebToken.encode(user_id: user.id),
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
