class User < ApplicationRecord
    
    belongs_to :employee
    
    has_secure_password
    
    
    validates_uniqueness_of :email, :employee_id
    validates_uniqueness_of :email, :employee_id
    validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format"
      
      
    ROLES = [['admin', :admin],['manager', :manager],['employee', :member]]
    
    
     def role?(authorized_role)
        return false if self.employee.nil? 
        return false if !self.employee..current_assignment.nil? && authorized_role!=:admin
        self.employee.role.to_sym == authorized_role
    end


    
    
end
