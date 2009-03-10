class Calendar < ActiveRecord::Base
  
  set_primary_key "cal_id"
  self.inheritance_column = "cal_type"
  
  has_many :events
  
  
end