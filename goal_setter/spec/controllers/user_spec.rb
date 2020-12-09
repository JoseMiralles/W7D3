require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'renders the user index' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the user show page' do
      create(:user)
      get :show, params: { id: User.last.id }

      expect(response).to render_template(:show)
    end

    it 'has status 404 if id invalid' do
      create(:user)
      get :show, params: { id: 1000000000000 }

      expect(response).to have_http_status(404)
    end
  end

  describe 'GET #new' do
    it 'render the new user page' do
      get :new
    end
  end

  describe 'POST #create' do
    let(:jose) {User.create!(username: "jmiralles", password: "josemejia123")}
    let(:paul) {User.create!(username: "pramirez", password: "pramirez123")}

    context "with invalid params" do
        it "validates the presence of the user's username and password" do
          post :create, params: { user: { username: "josemiralles", password: ""} }
        
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
        end
    end

    context "with valid params" do


    end
  end


end
