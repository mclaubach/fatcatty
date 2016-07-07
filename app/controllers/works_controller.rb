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

  def create
     @work = Work.new(work_params)
     respond_to do |format|
      if @work.save
        format.js # Will search for create.js.erb
      else
        format.html { render root_path }
      end
    end
  end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def work_params
  params.require(:work).permit(:image, :title)
end

end