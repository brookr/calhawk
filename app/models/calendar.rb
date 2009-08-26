class Calendar < ActiveRecord::Base
  
  establish_connection :production_lf #if RAILS_ENV == "production"
  
  set_primary_key "cal_id"
  self.inheritance_column = "cal_type"
  
  has_many :events
  belongs_to :casemap, :foreign_key => "link_id"
  
end