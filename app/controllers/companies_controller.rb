class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]
  before_action :authorize_user, :only => [:edit, :destroy]

  def index
    # q = "'%#{params[:search_term]}%'"
    # @companies = Company.where("name like ? or status like ?", q, q)
    @companies = Company.all
    # @search = Company.search(params[:q])
    # @companies = @search.result(distinct: true)
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
    @technology = Technology.all
  end

  def update
    @company = Company.find(params[:id])
    updates = company_params

    updates.each {|key, value| updates.delete(key) if value == ""}
    @company.update_attributes(updates)

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
    params.require(:company).permit(:name, :size, :avatar, :location, :status, :latitude, :longitude, :phone, :email, :website, :hours)
  end

  def authorize_user
    unless user_signed_in? && current_user.id == Company.find(params[:id]).user.id
      flash[:error] = "You do not have permission to view that page."
      redirect_to Company.find(params[:id])
    end
  end
end
