class ManegersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = current_user
    @site = Site.all
  end
  def new
    if params[:error].present?
      @user = params[:error]
    end
    @site = Site.find(params[:id])
  end
  def create
    if params[:password] == params[:confirm_password]
      @user = User.new(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
      if @user.save
        Site.find(params[:site_id].to_i).users << @user
        redirect_to :controller => 'sites', :action => 'index'
      else
        if params[:password] != params[:confirm_password]
          @error = 'Password and confrim password should be same'
        end
        @site =  Site.find(params[:site_id])
        render 'new'
      end
    else
      @site =  Site.find(params[:site_id])
      @error = 'Password and confrim password should be same'
      render 'new'
    end

  end
end
