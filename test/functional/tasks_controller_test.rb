require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  context 'GET to index' do
    setup { get :index }

    should_respond_with :success
    should_render_template :index
  end

  context 'GET to show for existing task' do
    setup do
      @task = Factory(:event)
      get :show, :id => @task.to_param
    end

    should_respond_with :success
    should_render_template :show
    should_assign_to :task, :equals => '@task'
  end

end

