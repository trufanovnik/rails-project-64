# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'authented user can like' do
    post = posts(:one)
    user = users :one
    sign_in user
    assert_not post.already_liked?(user)
    post post_likes_path(post)
    assert_redirected_to post_path(post)
    assert post.already_liked?(user)
  end

  test 'double like not raises' do
    post = posts(:one)
    user = users :one
    sign_in user
    assert_not post.already_liked?(user)
    post post_likes_path(post)
    assert_nothing_raised { post post_likes_path(post) }
    assert post.already_liked?(user)
  end

  test 'double unlike not raises' do
    post = posts(:two)
    user = users :one
    sign_in user
    assert post.already_liked?(user)
    delete post_like_path(post, 0)
    assert_nothing_raised { delete post_like_path(post, 0) }
    assert_not post.already_liked?(user)
  end

  test 'not authented user redirected when like' do
    post = posts(:one)
    user = users :one
    assert_not post.already_liked?(user)
    post post_likes_path(post)
    assert_redirected_to new_user_session_path
    assert_not post.already_liked?(user)
  end

  test 'authented user can unlike' do
    post = posts(:two)
    user = users :one
    sign_in users(:one)
    post_like = PostLike.find_by(user: user, post: post)
    assert post_like
    delete post_like_path(post, post_like)
    assert_redirected_to post_path(post)
    assert_not post.already_liked?(user)
  end

  test 'not authented user redirected when unlike' do
    post = posts(:two)
    user = users :one
    sign_out users(:one)
    post_like = PostLike.find_by(user: user, post: post)
    assert post_like
    delete post_like_path(post, post_like)
    assert_redirected_to new_user_session_path
    assert post.already_liked?(user)
  end
end
