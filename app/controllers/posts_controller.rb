class PostsController < ApplicationController

   def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    #  @posts = Post.paginate(:page => params[:page], :per_page => 10) start of pagination
    end
  end

    def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post deleted"
      redirect_to root_path
    end

   def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.js # Will search for create.js.erb
      else
        format.html { render root_path }
      end
    end
  end

 private
  def post_params
    params.require(:post).permit(:title, :body, :score, :all_tags)
  end
end
