module Api
  module V1
    class AuthController < ApplicationController
      def login
        if user&.authenticate(params[:password])
          token = JsonWebToken.encode({ user_id: user.id })

          render json: { token: }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      def signup
        user = User.new(user_params)

        if user.save
          token = JsonWebToken.encode({ user_id: user.id })

          render json: { token: }, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user
        @user ||= User.find_by(email: params[:email])
      end

      def user_params
        params.permit(:name, :email, :password, :password_confirmation, :role, :plan_id)
      end
    end
  end
end
