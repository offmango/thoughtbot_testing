require 'spec_helper'

describe TodosController, '#index' do
	context 'not signed in' do
		it 'redirects me to create a new session' do
			get :index
			should redirect_to(new_session_path)  # should is from shoulda matchers
		end
	end

	context 'signed in' do
		before do
			controller.current_email = 'john@example.com'
		end

		it 'responds successfully' do
			get :index
			should respond_with(:success)
		end

		it 'assigns @todos' do
			get :index
			should assign_to(:todos)
		end
	end
end