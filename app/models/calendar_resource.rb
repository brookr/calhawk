class CalendarResource < ActiveResource::Base
  self.site = "http://lorp.casehawk.net/"
  self.element_name = "calendar"
  self.user = 'api'
  self.password = 'publicinterface'
end