class Flavor < ApplicationRecord
    
  has_many :store_flavors
  has_many :stores, through: :store_flavors
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order(:name) }
  
  validates_presence_of :name
  
  before_destroy :destroyable
  after_rollback :make_inactive
  
  private
  def destroyable
  	return false
  end
  
  # def make_inactive
  # 	self.update_attribute(:active, false)
  # end

  
end
