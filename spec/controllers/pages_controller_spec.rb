require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET /home' do
    before do
      create(:salary)
      create(:salary, year: 2021)
    end

    context 'no query' do
      it 'returns all salaries' do
        get :home
        expect(response).to have_http_status(:success)
        expect(controller.instance_variable_get(:@salaries).length).to eq(2)
      end
    end

    context 'with query' do
      it 'returns queried salaries' do
        get :home, params: { query: { year: 2021 } }
        expect(response).to have_http_status(:success)
        expect(controller.instance_variable_get(:@salaries).length).to eq(1)
      end
    end
  end
end
