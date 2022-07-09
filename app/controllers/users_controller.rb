class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @request = FriendRequest.new()
  end

  def new_request
    
  end
end
