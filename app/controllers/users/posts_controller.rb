# frozen_string_literal: true

module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!, only: %i[update destroy]
    before_action :set_user, only: %i[index]
    before_action :set_post, only: %i[show edit update destroy]

    def index
      @posts = @user.posts
    end

    def show; end

    def new
      @post = Post.new
    end

    def edit; end

    def create
      @post = Post.new(post_params.merge(user_id: current_user.id))

      return redirect_to user_post_url(current_user, @post), notice: 'Post was successfully created.' if @post.save

      render :show, status: :created, location: @post
    end

    def update
      return redirect_to user_posts_path, notice: 'Sorry, this is just a demo app! 👀'

      return redirect_to user_post_url(@post), notice: 'Post was successfully updated.' if @post.update(post_params)

      render :show, status: :ok, location: @post
    end

    def destroy
      return redirect_to user_posts_path, notice: 'Sorry, this is just a demo app! 👀'

      @post.destroy
      redirect_to user_posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
