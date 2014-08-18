class MedPrescribedBy

  include Mongoid::Document

  belongs_to :medication
  belongs_to :doctor
  
end
