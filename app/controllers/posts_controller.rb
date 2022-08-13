class PostsController < ApplicationController
    before_action :authenticate_user!, only: %i[index]
    before_action :correct_user, only: %i[destroy]

    def index
        @posts = Post.recent.paginate(page: params[:page], per_page: 5)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "投稿しました"
            redirect_to root_url
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "更新しました"
            redirect_to @post
        else
            redirect_to :edit
        end

    end

    def destroy
        @post.destroy
        flash[:success] = "削除しました"
        redirect_to root_url, status: 303
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_url if @post.nil?
    end
end
