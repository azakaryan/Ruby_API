module Api
  module V1
    class SubscribersController < ActionController::Base
      def index
        puts "send get request"
        users = User.all
        render(json: users.to_json, status: :ok)
      end 

      def create
        if check_for_params(params)
          u = {email:params[:email], username: params[:username]}
          user = User.where(u)
          if user.any?
            render(json: '', status: :conflict)
          else
            User.create(u)
            render(json: '', status: :ok)
          end
        else   
          render(json: '', status: :payment_required)
        end          
      end

      private

      def check_for_params data
        !!data[:email] && data[:username]
      end

    end
  end
end