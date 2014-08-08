class Calendar
  include Mongoid::Document

  belongs_to :patient
end
