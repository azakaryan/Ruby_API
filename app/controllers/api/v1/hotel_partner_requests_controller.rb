module Api
  module V1
    class HotelPartnerRequestsController < ActionController::Base
      def create
        req = HotelPartnerRequest.create(hotel_partner_request_params)
        if req.errors.any?
          render(json: { error: build_errors(*req.errors.first) }, status: :bad_request)
        else
          render(nothing: true)
        end
      end

      private

      def build_errors(k, text)
        { key: k, text: text }
      end
      
      def hotel_partner_request_params
        params.require(:hotel_partner_request).permit(permitted_params)
      end

      def permitted_params
        [
          :hotel_name,
          :name, :surname,
          :email, :phone,
          :country, :city,
          :url,
          :role_id,
        ]
      end
    end
  end
end
