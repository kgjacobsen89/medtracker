class PatientMedication

  include Mongoid::Document

  belongs_to :patient 
  belongs_to :medication 
  
end
