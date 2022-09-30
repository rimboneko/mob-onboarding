class ApplicationController < ActionController::API
  before_action :authenticate_request
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = JsonWebToken.decode(header) if decoded
    #@current_user = User.find(decoded[:user_id])
    @current_user = User.find(id=1)
  end
  #def current_user
  #authenticate_request
  #end

  #def authenticate_request
  #@token = request.headers["Authorization"]
  #@token = @token.split(" ").last if @token
  #end
  #def current_user
  #JsonWebToken.decode(@token)[:user_id] if @token
  #end
end
