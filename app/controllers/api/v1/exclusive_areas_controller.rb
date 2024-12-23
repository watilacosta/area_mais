module Api
  module V1
    class ExclusiveAreasController < ApplicationController
      def index
        exclusive_areas = authorize policy_scope(ExclusiveArea)

        render json: exclusive_areas, status: :ok
      end

      def create
        exclusive_area = authorize current_user.owned_areas.build(exclusive_area_params)

        if exclusive_area.save
          render json: exclusive_area, status: :created
        else
          render json: { errors: exclusive_area.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def exclusive_area_params
        params.require(:exclusive_area).permit(:name, :description, :price)
      end
    end
  end
end
