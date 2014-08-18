class PatientMedication < Medication 

	field :dosage, type: String
  field :periodicity, type: String
  field :duration, type: String
  field :start_date, type: Date
  field :end_date, type: Date

  belongs_to :patient 
  belongs_to :medication 
  
end
