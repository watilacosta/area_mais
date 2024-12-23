class ApplicationController < ActionController::API
  include Pundit::Authorization

  after_action :verify_authorized
  before_action :authorize_request

  attr_reader :current_user

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded = JsonWebToken.decode(token)

    @current_user = User.find(decoded[:user_id]) if decoded
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: "Unauthorized" }, status: :unauthorized
  end
end
