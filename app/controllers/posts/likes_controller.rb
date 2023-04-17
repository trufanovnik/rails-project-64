# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post!
    before_action :find_like, only: [:destroy]

    def create
      set_post!
      @post.likes.create!(user_id: current_user.id) unless already_liked?
      redirect_to @post
    end

    def destroy
      if already_liked?
        @like.destroy
      else
        flash[:notice] = 'Cannot unlike'
      end
      redirect_to post_path(@post)
    end

    private

    def find_like
      @like = @post.likes.find(params[:id])
    end

    def already_liked?
      PostLike.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

    def set_post!
      @post = Post.find params[:post_id]
    end
  end
end
