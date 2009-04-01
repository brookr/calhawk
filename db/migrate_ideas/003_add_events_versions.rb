class AddEventsVersions < ActiveRecord::Migration
  require_dependency 'event'
  def self.up
    # create_versioned_table takes the same options hash
    # that create_table does
    Event.create_versioned_table
  end

  def self.down
    Event.drop_versioned_table
  end
end
