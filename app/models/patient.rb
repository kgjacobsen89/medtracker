class Patient
	include Mongoid::Document
  include ActiveModel::SecurePassword
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :sex, type: String
  field :DOB, type: String
  field :doctor, type: Boolean

  has_secure_password

  validates_presence_of :first_name, :last_name, :DOB
  belongs_to :doctor
  has_many :medications

end
