class Case < ActiveRecord::Base
  
  establish_connection :production_lf #if RAILS_ENV == "production"
  
  set_table_name "casemap"
  set_primary_key "case_id"
  
  has_one :calendar
  
  
end