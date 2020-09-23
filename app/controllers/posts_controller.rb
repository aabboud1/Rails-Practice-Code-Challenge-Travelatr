class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(params[:id])
    @post.increment!(:likes)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params["post"]["title"],
                    params["post"]["content"],
                    params["post"]["lieks"],
                    params["post"]["blogger"],
                    params["post"]["destination"])
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def update
    if @post.update(params["post"]["title"],
                   params["post"]["content"],
                   params["post"]["lieks"],
                   params["post"]["blogger"],
                   params["post"]["destination"])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


end
