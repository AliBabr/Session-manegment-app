class ManegersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = current_user
  end
  def new
    @site = Site.find(params[:id])
  end
  def create
    if params[:password] == params[:confirm_password]
      user = User.create(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
      Site.find(params[:site_id].to_i).users << user
    end
    redirect_to :controller => 'sites', :action => 'index'
  end
end
