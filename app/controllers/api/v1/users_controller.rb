module Api
  module V1
    class UsersController < Api::V1::BaseController
      acts_as_token_authentication_handler_for User, except: :index
      before_action :set_user, only: [:show]

      def index
        @users = policy_scope(User)
      end

      def show
        authorize @user
        @matching_interests = matching_interests?(@user.interests, current_user.interests)
        @matching_times = available?(@user, current_user)
      end

      def search
        @users = User.all
        authorize @users
        @matching_users = []
        @users.each do |user|
          if matching_interests?(user.interests, current_user.interests).length.positive? && available?(user, current_user).length.positive?
            @matching_users << user
          end
        end
        # authorize @matching_users
      end


      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
