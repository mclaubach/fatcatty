class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def showrandom
    @post = Post.offset(rand(Post.count)).first
    redirect_to @post
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      @postspag = Post.paginate(page: params[:page], per_page: 12).order('created_at DESC')
    else
      @posts = Post.paginate(page: params[:page], per_page: 12).order('created_at DESC')
      @postspag = Post.paginate(page: params[:page], per_page: 12).order('created_at DESC')
    end
  end

    def destroy
      Post.find(params[:id]).destroy
      redirect_to root_path
    end

    def create
     @post = Post.new(post_params)
       if @post.save
         redirect_to root_path
       else
         format.html { render root_path }
       end
     end
   end

  private
   def post_params
     params.require(:post).permit(:title, :body, :score, :all_tags)
   end
