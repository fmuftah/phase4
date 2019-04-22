class Shift < ApplicationRecord
  
  belongs_to :assignment
  has_one :employee, through: :assignment
  has_one :store, through: :assignment
  has_many :shift_jobs
  has_many :jobs, through: :shift_jobs
  
  before_create :shift_end_time
  
  validates_presence_of :start_time

  
  scope :completed,-> { joins(:shift_jobs).group(:shift_id) }
  scope :incompleted,-> { joins("LEFT JOIN shift_jobs ON shift_id")}
  scope :for_store,->(store_id) { joins(:assignment, :store).where("assignments.store_id = ?", store_id) }
  scope :for_employee, ->(employee_id) { joins(:assignment, :employee).where("assignments.employee_id = ?", employee_id)}
  scope :past, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date >= ?', Date.current) }
  scope :for_next_days, ->(x) { where('date BETWEEN ? AND ?', Date.today, x.days.from_now.to_date) }
  scope :for_past_days, ->(x) { where('date BETWEEN ? AND ?', x.days.ago.to_date, 1.day.ago.to_date) }
  scope :chronological,-> { order('start_time asc') }
  scope :by_store, -> { joins(:assignment, :store).order('stores.name') }
  scope :by_employee, -> { joins(:assignment, :employee).order('employees.last_name, employees.first_name') }
    
  
  def completed?
    self.shift_jobs.count > 0
  end
  
  def start_now
    self.update_attribute(:start_time, Time.current)
  end

  def end_now
    self.update_attribute(:end_time, Time.current)
  end

  private 
  def current_assignment
    unless self.assignment.nil? || self.assignment.end_date.nil?
      errors.add(:assignment_id, "assignment is not current")
    end
  end
  
  def shift_end_time
    self.end_time = self.start_time + (3*60*60)
  end
  
end
