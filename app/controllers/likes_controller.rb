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

        redirect_to root_path
    end

    def destroy
        @like.destroy
        redirect_to root_path
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: @post.id).exists?
    end

    
end

