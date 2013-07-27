require 'spec_helper'

describe SessionsController do

  describe "GET 'index'" do
    it "returns http success and null" do
      get 'index'
      response.should be_success
      expect(response.body).to eq("null")
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      @request.env["omniauth.auth"].stub_chain(:credentials, :token).and_return("test_token")
      @request.env["omniauth.auth"].stub_chain(:credentials, :secret).and_return("test_secret")

      expect_user_id = 1
      allow(User).to receive(:save_by_twitter_auth!).and_return(User.new(:_id => expect_user_id))

      get 'create', :provider => "twitter"

      expect(response).to redirect_to(root_url)
      expect(session[:uid]).to eq(expect_user_id)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      expect(response).to redirect_to(root_url)
      expect(session[:uid]).to eq(nil)
      expect(session[:oauth_token]).to eq(nil)
      expect(session[:oauth_token_secret]).to eq(nil)
    end
  end

end
