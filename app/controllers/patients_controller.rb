class PatientsController < ApplicationController

	# For doctors to see list of patients
	def index
		my_patient_filter = params[:patientfilter]
		case my_patient_filter
		when "Show All"
			@patients = Patient.all
		when "Male"
			@patients = Patient.where(:sex => "Male")
		when "Female"
			@patients = Patient.where(:sex => "Female")
		else 
			@patients = Patient.all
		end
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.find(params[:patient_id])
	end

	def create
		@patient = Patient.new(patient_params)
		if @patient.save 
			redirect_to user_patient_path(@user.id, @patient.id)
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
			redirect_to user_patient_path(@user.id)
		else 
			render 'edit'
		end
	end

	# For doctors to delete patients
	def destroy
		Patient.find(params[:id]).destroy
		redirect_to user_patients_path(@user.id)
	end

	private 

	def patient_params 
		params.require(:patient).permit(
			:first_name, :last_name, :sex, :DOB, :email, :phone_number, :blood_type, :medication_ids => [], :doctor_ids => [])
	end

end
