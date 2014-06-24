class CompaniesController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
  	@company = Company.create(company_params)

  	flash[:success] = "Company successfully created."
  	redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def company_params
    params.require(:company).permit(:name, :size, :avatar, :location, :status, :latitude, :longitude)
  end

end
