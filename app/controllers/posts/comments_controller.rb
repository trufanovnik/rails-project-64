# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      # @post.comment_id = @comment[:id]
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, warning: @comment.errors.full_messages.join(' ')
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_comment_id)
    end
  end
end
