class MedPrescribedBy

  include Mongoid::Document

  belongs_to :patient_medication
  belongs_to :doctor
  
end
