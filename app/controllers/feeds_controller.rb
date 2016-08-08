class FeedsController < ApplicationController
  layout false

  def index
    @posts = Post.order('created_at DESC')
    @title = "(๑ↀᆺↀ๑) (๑ↀᆺↀ๑) (๑ↀᆺↀ๑)"
    @updated = @posts.first.created_at unless @posts.empty?
  end
end
