class TasksController < ApplicationController

  def index
    @uncompleted_past = Event.find(:all, :conditions => ["(event_type = 'Target' OR 
                                                          event_type = 'Deadline') 
                                                        AND completed = 0 
                                                        AND dtstart < NOW()
                                                      "],
                                        :order => :calendar_id )
    
    @uncompleted_future = Event.find(:all, :conditions => ["(event_type = 'Target' OR 
                                                            event_type = 'Deadline') 
                                                          AND completed = 0 
                                                          AND dtstart > NOW()
                                                        "],
                                          :order => :calendar_id )
    
    @completed = Event.find(:all, :conditions => ["(event_type = 'Target' OR 
                                                    event_type = 'Deadline') 
                                                  AND completed = 1 
                                                "],
                                  :order => :calendar_id )
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
    
  end

  def show
    @task = Event.find(params[:id])
  end

end