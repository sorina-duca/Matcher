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

end
