class ArchivesController < ApplicationController
def index
    @posts = Post.all
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
end
end