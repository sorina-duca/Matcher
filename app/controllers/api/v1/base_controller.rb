module Api
  module V1
    class BaseController < ActionController::API
      include Pundit

      after_action :verify_authorized, except: :index
      after_action :verify_policy_scoped, only: :index

      rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def user_not_authorized(exception)
        render json: {
          error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
        }, status: :unauthorized
      end

      def not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def matching_interests?(interests_user, interests_searcher)
        interests_searcher.select { |interest| interests_user.include?(interest) }
      end

      def available?(user, searcher)
        if searcher.availabilities.any? == false || user.availabilities.any? == false
          []
        else
          src_av_start = searcher.availabilities.map(&:start)
          src_av_end = searcher.availabilities.map(&:end)
          user.availabilities.select do |av|
            src_av_end.any? { |a| av.start < a } && src_av_start.any? { |s| av.end > s }
          end
        end
      end

      helper_method :matching_interests, :available
    end
  end
end
