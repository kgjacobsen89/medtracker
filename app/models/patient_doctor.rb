class PatientDoctor

  include Mongoid::Document

  belongs_to :patient 
  belongs_to :doctor
  
end
