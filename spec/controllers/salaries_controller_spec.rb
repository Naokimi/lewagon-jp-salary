require 'rails_helper'

RSpec.describe SalariesController, type: :controller do
  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:salary) { build(:salary) }

    it 'creates a Salary' do
      post :create, params: { salary: salary.attributes.except(:id) }
      expect(response).to have_http_status(:redirect)
      expect(Salary.find_by(workweek: salary.workweek)).to be
    end
  end
end
