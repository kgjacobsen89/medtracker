class PatientMedication

  include Mongoid::Document

  belongs_to :patient 
  belongs_to :medication 
  has_many :med_prescribed_bys
  
end
