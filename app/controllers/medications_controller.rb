class MedicationsController < ApplicationController

	def index
		@medications = Medication.all
	end
	def show
		@bean = Medication.find(params[:id])
	end
	def new
		@medication = Medication.new
	end
	def create
		@medication = Medication.new(params.require(:medication).permit(:name, :dosage, :periodicity, :duration)) 
		if @medication.save 
			redirect_to medications_path
		else 
			render 'new' 
		end  
	end
	def edit
		@medication = Medication.find(params[:id])
	end
	def update
		@medication = Medication.find(params[:id])
		if @medication.update_attributes(params.require(:medication).permit(:name, :dosage, :periodicity, :duration))
			redirect_to medications_path
		else 
			render 'edit'
		end
	end
	def destroy
		@medication = Medication.find(params[:id])
		@medication.destroy 
		redirect_to medications_path
	end
end
