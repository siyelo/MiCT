class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]

  def index
  	@companies = Company.all
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
    else
      flash[:error] = "Company could not be created."
    end

  	redirect_to root_path
  end

  def edit
    @company = Company.find(params[:id])
    @technology = Technology.all
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

  def tech_tags
    @company = Company.find(params[:id])
    if params[:add_tech] != nil
      params[:add_tech].each { |t|
        @company.technologies << Technology.find(t)
      }
    end
    if params[:remove_tech] != nil
      params[:remove_tech].each { |t|
        @company.technologies.delete(Technology.find(t))
      }
    end

    flash[:success] = "Company profile successfully changed."
    redirect_to @company
  end

  private
  def company_params
    params.require(:company).permit(:name, :size, :avatar, :location, :status, :latitude, :longitude)
  end

end
