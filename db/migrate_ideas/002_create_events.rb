class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
     
      t.references  :user
      
      t.integer :case_id
      t.integer :creator_id

      t.string :summary
      t.text :description
      t.text :status
      t.datetime :dtstart
      t.datetime :dtend
      t.string :rrule
      t.string :location
      t.string :alarm
      t.integer :calendar_id
      t.string :event_type
      t.boolean :busy
      t.string :timezone

      t.timestamps
      
    end
  end

  def self.down
    drop_table :events
  end
end
