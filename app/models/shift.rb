class Shift < ApplicationRecord
  
  belongs_to :assignment
  has_one :employee, through: :assignment
  has_one :store, through: :assignment
  has_many :shift_jobs
  has_many :jobs, through: :shift_jobs
  
end
