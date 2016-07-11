class WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def index
    @works = Work.all
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

end