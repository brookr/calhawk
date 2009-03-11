class Event < ActiveRecord::Base
  
  establish_connection :production_lf #if RAILS_ENV == "production"
  
  set_primary_key "event_id"
  self.inheritance_column = 'event_type'
  
  has_sti_factory
  #acts_as_versioned
  
  belongs_to :user, :foreign_key => "creator_id"
  belongs_to :calendar
  
  def self.list_by_day( day )
    Event.find(:all, :conditions => ["dtstart LIKE ? ", "#{day.to_s}%"])
  end
  
end
