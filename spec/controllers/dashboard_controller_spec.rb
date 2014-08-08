require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  describe "GET index" do

    it 'should render the :index template' do
      account = create(:account_with_schema)
      expect(get: dashboard_root_url(subdomain: account.subdomain)).to route_to(
        controller: "dashboard",
        action: "index"
      )
    end

  end

end
