class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # Authentication
  http_basic_authenticate_with name: "test", password: "test", except: [:index, :show]

  def new
    @post = Post.new
  end
    
  def index
    #@posts = Post.all # mem killer in real apps
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def create
    #render text: params[:post].inspect
    #@post = Post.new(params[:post])
    @post = Post.new(post_params)
    # Not working in 4.0.3. DGL 20140917
    #@post = Post.new(params[:post].permit(:titile, :text))  
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # Updates are implemented by methods edit and update
  def edit
    #@post = Post.find(params[:id]) # replaced by set_post
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # Pagination: see https://github.com/bootstrap-ruby/will_paginate-bootstrap
  def show
    @comments = Comment.where(post_id: @post.id).paginate(page: params[:page], per_page: 2)
    #@post = Post.find(params[:id]) # replaced by set_post
  end

  # Delete a record
  def destroy
    #@post = Post.find(params[:id]) # replaced by set_post
    @post.destroy
    redirect_to posts_path
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
