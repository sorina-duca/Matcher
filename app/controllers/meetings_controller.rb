class MeetingsController < ApplicationController
  include Pundit

  def new
    @user = User.find(params[:user_id])
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @user = User.find(params[:user_id])
    @meeting.requester_id = current_user
    @meeting.accepter_id = @user
    authorize @meeting
    if @meeting.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start, :end, :requester_id, :accepter_id)
  end
end
