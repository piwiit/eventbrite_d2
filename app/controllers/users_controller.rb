class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def new; end

  def show
    current_user
  end

  def create; end
end
