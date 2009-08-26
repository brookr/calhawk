namespace :sync do 
  #
  # Add or update existing cases as tags. Does not delete.
  #
  desc 'Sync case ids and titles between PHP and Rails app databii'
  task :cases, :preview, :to, :needs => :environment do |t, args|
    errors = []
    for title in (Case.all.map(&:case_title) - Tag.all.map(&:name))
      begin
        t = Tag.find_or_initialize_by_id(Case.find_by_case_title(title).id)
        t.update_attribute(:name, title)
        puts "Updated case #{t.id} with title #{t.name}"
      rescue
        errors << title
        puts "Error in syncing: #{title}"
      end
      puts
      puts "Could not sync: #{errors.join(', ')}." unless errors.blank?
    end
  end
end