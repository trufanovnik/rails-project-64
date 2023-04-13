module Post
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create!(comment_params)
      @comment.user = current_user
      @post.comment_id = @comment[:id]
      if @comment.save
        redirect_to @post, notice: "Comment was successfully created." 
      else
        redirect_to @post, warning: @comment.errors.full_messages.join(' ')
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content)
    end
  end
end