class HomepagesController < ApplicationController
  before_action :set_homepage, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /homepages or /homepages.json
  def index
    @user = current_user
    @posts = Post.all.order("created_at DESC")
  end

  # GET /homepages/1 or /homepages/1.json
  def show
  end

  # GET /homepages/new
  def new
    @homepage = Homepage.new
  end

  # GET /homepages/1/edit
  def edit
  end

  # POST /homepages or /homepages.json
  def create
  end

  # PATCH/PUT /homepages/1 or /homepages/1.json
  def update
  end

  # DELETE /homepages/1 or /homepages/1.json
  def destroy

  end

  def friend_page
    @friends = current_user.friends()
  end

  def search
    @parameter = params[:search].downcase
    @users = User.where("lower(name) LIKE :search", search: "%#{@parameter}%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homepage
      @homepage = Homepage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homepage_params
      params.fetch(:homepage, {})
    end
end
