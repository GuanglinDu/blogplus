class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_comment, :only => [:show, :edit, :update, :destroy]

  # Authentication
  http_basic_authenticate_with name: "test",  password: "test", only: :destroy

  # POST /posts/:post_id/comments
  # POST /posts/:post_id/comments.xml
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  # Notice: Updates are implemented by methods edit and update
  def edit
  end 
 
  # PUT /posts/:post_id/comments/:id
  # PUT /posts/:post_id/comments/:id.xml
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        # 1st argument of redirect_to is an array,
        # in order to build the correct route to the nested resource comment.
        # Stay at the comment editing page
        #format.html { redirect_to [@comment.post, @comment],
        #  notice: 'Comment was successfully updated.' }
        # To the comment list page
        format.html { redirect_to @comment.post,
          notice: 'Comment was successfully updated.' }
        format.json { head :no_content } # 204 No Content
        #format.json { respond_with_bip(@comment) }
      else
        format.html { render action: 'edit' }
        format.json {
          render json: @comment.errors, status: :unprocessable_entity
        }
        #format.json { respond_with_bip(@comment) }
      end
    end
  end
  
  def show
  end
  
  # Redirection to the list of Comments: redirect_to(post_comments_url)
  # See http://goo.gl/VTsNPB
  # 1st you retrieve the post thanks to params[:post_id]
  # post = Post.find(params[:post_id])
  # 2nd you retrieve the comment thanks to params[:id]
  # @comment = post.comments.find(params[:id])
  def destroy
    @comment.destroy
    redirect_to post_path(@post) # original version
    #redirect_to @comment.post # also works
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def comment_params
    params[:comment].permit(:commenter, :body)
  end
end
