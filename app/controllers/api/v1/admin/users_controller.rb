module Api
  module V1
    module Admin
      class UsersController < ApplicationController
        def index
          users = authorize([ :admin, User.non_members ])

          render json: users, status: :ok
        end
      end
    end
  end
end
