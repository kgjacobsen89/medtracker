class Patient < User
  field :sex, type: String
  field :DOB, type: Date
  validates_presence_of :first_name, :last_name, :DOB
  belongs_to :doctor
end
