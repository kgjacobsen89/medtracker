class UsersController < ApplicationController

	def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user_type] == 'Patient'
      @user = Patient.new(user_params)
        session[:user_id] = @user.id.to_s if @user.save
        redirect_to new_patient_path(patient_id: @user.id)
    elsif params[:user_type] == 'Doctor'
      @user = Doctor.new(user_params)
        session[:user_id] = @user.id.to_s if @user.save
        redirect_to new_doctor_path(doctor_id: @user.id)
    else
      render 'new'
    end
  end

  def destroy
  	User.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation)
  
end
