class PagesController < ApplicationController
  include Pundit

  skip_after_action :verify_authorized, only: [:home]

  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
end
