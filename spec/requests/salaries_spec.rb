require 'rails_helper'

RSpec.describe "Salaries", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/salaries/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/salaries/create"
      expect(response).to have_http_status(:success)
    end
  end

end
