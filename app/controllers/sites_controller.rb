class SitesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @site = Site.all
  end

  def new
  end

  def create
    Site.create(name: params[:name], contact: params[:contact], address: params[:address])
    redirect_to action: "index"
  end
  def show
  end
  def new_site_bY_map
  
  end
  def show
    @site = Site.all
  end
  def search
    if params[:sites][:name].present?
      @site = Site.find(params[:sites][:name].to_i)
    else
      redirect_to action: 'index'
    end
  end
end
