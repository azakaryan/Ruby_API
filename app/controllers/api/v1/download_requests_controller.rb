module Api
  module V1
    class DownloadRequestsController < ActionController::Base
      include TwilioHelper
      
      def create
        args = download_request_params
        args = args.except(:locale) if args.fetch(:locale, '').empty?
        request = DownloadRequest.create(args)

        result = send_to_twilio(request.number, request.region, request.locale)
        render_twilio_result(result)
      end

      private

      def render_twilio_result(result)
        render(json: result, status: result.key?(:error) ? :bad_request : :ok)
      end
      
      def download_request_params
        params.require(:download_request).permit(:number, :region_id, :locale)
      end
    end
  end
end
