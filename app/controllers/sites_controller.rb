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
    byebug
  end
end
