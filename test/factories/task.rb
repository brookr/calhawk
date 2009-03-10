Factory.define :task do |event|
  event.case_id     1
  event.creator_id  1
  event.summary     "This event is happening!"
  event.dtstart     "2009-02-08 18:17:23"
  event.dtstamp     "2009-03-10 14:10:11"
  event.calendar_id "1"
  event.event_type  "Target"
  event.alarm       "stringy"
end
