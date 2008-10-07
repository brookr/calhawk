class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
     
      t.string    :type,            :limit => 40 #allows polymorphism
      
      t.string    :creator,         :limit => 40
      t.string    :summary,         :limit => 140
      t.string    :status,          :limit => 40
      t.string    :location,        :limit => 140
      t.string    :recur
      t.string    :timezone         
      
      t.text      :description      
      
      t.datetime  :start
      t.datetime  :end

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
