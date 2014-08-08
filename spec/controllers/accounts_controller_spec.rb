require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do

  describe "GET new" do
    it 'assigns a new contact object' do
      get :new
      expect(assigns(:account)).to be_a_new(Account)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET create" do

    context 'with valid attributes' do

      it 'saves the new account to the database' do
        user = attributes_for(:user)
        expect {
          post :create, account: attributes_for(:account, owner_attributes: user)
        }.to change(Account, :count).by(1)
      end

      it 'redirects to subdomain sign in' do
        user = attributes_for(:user)
        account = attributes_for(:account, owner_attributes: user)
        post :create, account: account
        expect(response).to redirect_to new_user_session_url(subdomain: account[:subdomain])
      end

    end

    context 'with invalid attributes' do

      it 'does not save the account to the database' do
        expect {
          post :create, account: attributes_for(:account)
        }.to_not change(Account, :count)
      end

      it 're-renders the :new template' do
        account = attributes_for(:account)
        post :create, account: account
        expect(response).to render_template(:new)
      end

    end

  end

end
