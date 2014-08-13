class Patient

	include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  has_many :doctors 
  has_many :medications

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :sex, type: String
  field :DOB, type: String

  validates_presence_of :first_name, :last_name, :DOB

end
