class AppointmentResource < EventResource
  self.site = "http://lorp.casehawk.net/"
  self.element_name = "event"
  self.user = 'api'
  self.password = 'publicinterface'
end