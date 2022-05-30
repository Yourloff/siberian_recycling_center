class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]
  before_action :check_admin, only: [:index]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Пользователь был успешно удален" }
      format.json { head :no_content }
    end
  end

  private

  def check_admin
    redirect_to root_path unless current_user.admin
  end

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
