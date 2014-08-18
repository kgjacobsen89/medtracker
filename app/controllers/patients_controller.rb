class PatientsController < ApplicationController

	# For doctors to see list of patients
	def index
		my_patient_filter = params[:patientfilter]
		case my_patient_filter
		when "Show All"
			@patients = Patient.all(order_by :last_name)
		when "Male"
			@patients = Patient.where(:sex => "Male")
		when "Female"
			@patients = Patient.where(:sex => "Female")
		else 
			@patients = Patient.all(order_by :last_name)
		end
	end

	def show
		@patient = Patient.find(params[:id])
		@doctors = Doctor.find(@patient.doctor_ids)
	end

	def new
		@patient = Patient.find(params[:patient_id])
	end

	def create
		@patient = Patient.new(patient_params)
		if @patient.save 
			#find doctors_ids in patient, then look up doctors based on doctor id, then add patient.id to a patient list in doctors model
			redirect_to patient_path
		else 
			render 'new' 
		end  
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(patient_params)
			redirect_to patient_path
		else 
			render 'edit'
		end
	end

	# For doctors to delete patients
	def destroy
		Patient.find(params[:id]).destroy
		redirect_to patients_path
	end

	private

	def patient_params
		params.require(:patient).permit(
			:first_name, :last_name, :phone_number, :sex, :DOB, :blood_type, :medication_ids => [], :doctor_ids => [])
	end

end
