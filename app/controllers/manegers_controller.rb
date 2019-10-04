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

  def edit
    @user = User.find(params[:id])
    @site = Site.find(params[:site_id])
  end


  def update_manager
    if params[:password] == params[:confirm_password]
      @user = User.find(params[:id])
      if @user.update_attributes!(email: params[:email], view_password: params[:confirm_password], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
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
      @user = User.find(params[:id])
      @error = 'Password and confrim password should be same'
      render 'edit'
    end
  end


  def delete_manager
    User.find(params[:id]).destroy!
    redirect_to :controller => 'sites', :action => 'index'
  end

  def create
    if params[:password] == params[:confirm_password]
      @user = User.new(email: params[:email], password: params[:password], view_password: params[:confirm_password], first_name: params[:first_name], last_name: params[:last_name])
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
