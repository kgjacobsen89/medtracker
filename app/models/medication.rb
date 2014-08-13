class Medication

  include Mongoid::Document

  belongs_to :patient 

  field :name, type: String
  field :dosage, type: String
  field :periodicity, type: String
  field :duration, type: Integer

  validates_presence_of :name, :dosage, :periodicity, :duration
  
end
