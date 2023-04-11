module Post
  class CommentsController < ApplicationController
    before_action :authenticate_user!, except: %i[show]
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user

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