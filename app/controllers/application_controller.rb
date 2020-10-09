class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_no interests])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_no interests])
  end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

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
