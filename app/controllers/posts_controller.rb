class PostsController < ApplicationController
  before_action :signed_in?, only: [:new,:create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post: params[:post][:post],user_id: current_user.id)
    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to posts_index_path
    else
      render 'new'
    end
  end


  private

  # Kicks user back to Index page if not signed in
  def signed_in?
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to posts_index_path
    end
  end



end
