class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]

  def index
    @search = Company.search(params[:q])
    @found = @search.result(distinct: true)
  	@companies = @found
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
  	@company = Company.new(company_params)

    if @company.save
    	flash[:success] = "Company successfully created."
      redirect_to root_path
    else
      flash[:error] = "Company could not be created."
      render "companies/new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    company_params.each {|attribute, value|
      company_params.delete(attribute) if company_params[:value] == ""
    }
    @company.update_attributes(company_params)

    flash[:success] = "Company profile successfully changed."
    redirect_to @company
  end

  def destroy
  end

  private
  def company_params
    params.require(:company).permit(:name, :size, :avatar, :location, :status, :latitude, :longitude, :phone)
  end

end
