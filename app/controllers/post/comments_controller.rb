class Post::CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_user
  def index
    @comments = Comment.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @comment = Comment.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice:  "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @comment.update(post_params)
        format.html { redirect_to post_url(@comment), notice:  "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @comment.destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice:  "Comment was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(@comment).permit(:content, :user_id)
    end

    def set_user
      @user = current_user
    end
end