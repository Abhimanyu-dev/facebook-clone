class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def index
        @pending_requests = current_user.pending_requests.all
        @sent_requests = current_user.friend_requests.all
    end
    def new
        request = FriendRequest.new()
        p request
    end

    def create
        FriendRequest.create({sender_id: current_user.id, receiver_id: request_params[:receiver_id]})
        redirect_to request.referrer        
    end

    def accept
        @request = FriendRequest.find(params[:id])
        @request.accept
        redirect_to request.referrer
    end

    private

    def request_params
        params.require(:friend_request).permit(:receiver_id)
    end
end
