class CompaniesController < ApplicationController

  def index
  end

  def new
  end

  def create
  	@company = Company.create(company_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def company_params
    params.require(:company).permit(:name, :size, :location, :status)
  end

end
