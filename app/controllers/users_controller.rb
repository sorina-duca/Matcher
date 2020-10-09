class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @users = policy_scope(User).order(first_name: :asc)
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

  def show
    authorize @user
    @matching_interests = matching_interests?(@user.interests, current_user.interests)
    @matching_times = available?(@user, current_user)
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def matching_interests?(interests_user, interests_searcher)
  #   interests_searcher.select { |interest| interests_user.include?(interest) }
  # end

  # def available?(user, searcher)
  #   if searcher.availabilities.any? == false || user.availabilities.any? == false
  #     []
  #   else
  #     src_av_start = searcher.availabilities.map(&:start)
  #     src_av_end = searcher.availabilities.map(&:end)
  #     user.availabilities.select do |av|
  #       src_av_end.any? { |a| av.start < a } && src_av_start.any? { |s| av.end > s }
  #     end
  #   end
  # end
end
