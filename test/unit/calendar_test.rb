require File.dirname(__FILE__) + '/../test_helper'
 
class CalendarTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:calendar)
  end
 
end
