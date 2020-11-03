class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new; end

  def show; end

  def create; end
end
