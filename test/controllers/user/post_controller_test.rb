# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @post = posts(:one)
  end

  test 'should get index' do
    get user_posts_path(users(:one))

    assert_response :success
  end

  test 'should get new' do
    get new_user_post_url(users(:one))

    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post user_posts_url(users(:one)), params: { post: { title: @post.title } }
    end

    assert_redirected_to user_post_url(users(:one), Post.last)
  end

  test 'should show post' do
    get user_post_url(users(:one), @post)

    assert_response :success
  end

  test 'should get edit' do
    get edit_user_post_url(users(:one), @post)

    assert_response :success
  end

  test 'should destroy post' do
    assert_difference('Post.count', 0) do
      delete user_post_url(users(:one), @post)
    end

    assert_redirected_to user_posts_path(users(:one))
  end
end
