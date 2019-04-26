class Job < ApplicationRecord
    
  has_many :shift_jobs
  has_many :shifts, through: :shift_jobs
  
  validates_presence_of :name
  
  scope :active,-> { where(active: true) }
  scope :inactive,-> { where(active: false) }
  scope :alphabetical,-> { order(:name) }
  
  
  before_destroy :stop
  after_rollback :make_inactive
  
  private
    def stop
        throw :abort
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
  
  
end
