class LikesController < ApplicationController   
    before_action :authenticate_user!
    before_action :find_post
    before_action :find_like, only: [:destroy]


    def index
        redirect_to root_path
    end

    def create
        if already_liked?
            @like.destroy
        else
            @post.likes.create(user_id: current_user.id)
        end

        redirect_to request.referrer
    end

    def destroy
        @like.destroy
        redirect_to request.referrer
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_like
        @like = @post.likes.find{|like| like.user_id == current_user.id}
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: @post.id).exists?
    end

    
end

