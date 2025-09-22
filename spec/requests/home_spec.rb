require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it 'returns a successful http response' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
