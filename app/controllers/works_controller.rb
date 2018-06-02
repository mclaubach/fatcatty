class WorksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    @work = Work.new
  end

  def index
#   @works = Work.all
  @works = Work.paginate(page: params[:page], per_page: 12).order('created_at DESC')
  @works = Work.order(sort_column + " " + sort_direction)
  end

  def show
    @work = Work.find(params[:id])
  end

  def destroy
     Work.find(params[:id]).destroy
     flash[:success] = "work deleted"
     redirect_to works_path
  end

  def create
     @work = Work.new(work_params)
      if @work.save
          redirect_to works_path
      else
    end
  end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def work_params
  params.require(:work).permit(:image, :title)
end

  def sort_column
    Work.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
