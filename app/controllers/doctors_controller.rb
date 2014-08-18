class DoctorsController < ApplicationController

	def index
		my_doctor_filter = params[:doctorfilter]
		case my_doctor_filter
		when "Show All"
			@doctors = Doctor.all(order_by :last_name)
		when "Psychiatrists Only"
			@doctors = Doctor.where(:speciality => "Psychiatrist")
		else 
			@doctors = Doctor.all(order_by :last_name)
		end
	end

	def new
		@doctor = Doctor.find(params[:doctor_id])
	end

	def create
		@doctor = Doctor.new(doctor_params)
		if @doctor.save
			redirect_to doctor_path
		else
			render 'new'
		end
	end

	def show
		@doctor = Doctor.find(params[:id])
	end

	def edit
		@doctor = Doctor.find(params[:id])
	end

	def update
		@doctor = Doctor.find(params[:id])
		if @doctor.update_attributes(doctor_params)
			redirect_to doctor_path
		else
			render 'edit'
		end
	end

	def destroy
		Doctor.find(params[:id]).destroy
		redirect_to root_path
	end

	private
	def doctor_params
		params.require(:doctor).permit(
			:first_name, :last_name, :speciality, :location, :phone_number, patient_medication_ids: [])
	end

end
