class UsersController < ApplicationController # before_action :good_user
  def good_user
    redirect_to root_path unless current_user == User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new; end

  def show
    @userfind = User.find(params[:id])
    current_user
  end

  def create; end
end
