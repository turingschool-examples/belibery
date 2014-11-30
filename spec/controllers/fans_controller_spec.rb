require 'rails_helper'

describe FansController do
  let(:valid_attributes) {
    { name: "Gustavo", email: "belieber@example.com" }
  }

  let(:invalid_attributes) {
    { name: nil, email: nil }
  }

  let(:fan) { Fan.create! valid_attributes }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all companies as @companies" do
      get :index, {}, valid_session
      expect(assigns(:fans)).to eq([fan])
    end
  end

  describe 'GET show' do
    it "assigns the requested company as @company" do
      get :show, { id: fan.id }
      expect(assigns(:fan)).to eq(fan)
    end
  end

  describe "GET new" do
    it "assigns a new company as @company" do
      get :new
      expect(assigns(:fan)).to_not be_nil
    end
  end

  describe "POST create" do
    it "creates a new company" do
      expect {
        post :create, fan: { name: "Gustavo", email: "belieber@example.com" }
      }.to change(Fan, :count).by(1)

      expect(response).to redirect_to(fan_path(assigns(:fan)))
      expect(flash[:notice]).to eq("You have created a fan.")
    end

    it "renders new when post is unsuccessful" do
      subject = post :create, fan: { email: "belieber@example.com" }
      expect(subject).to render_template(:new)
      expect(flash[:alert]).to eq("The fan was not created. Please try again.")
    end
  end


  describe "GET edit" do
    it "assigns the requested company as @company" do
      get :edit, { id: fan.id }
      expect(assigns(:fan)).to eq(fan)
    end
  end

  describe "PUT update" do
    it "updates a fan" do
      patch :update, { id: fan.id, fan: { name: "Horacio" } }

      assert_redirected_to
      expect(response).to redirect_to(fan_path(assigns(:fan)))
      expect(flash[:notice]).to eq("You have updated a fan.")
      result = Fan.find(fan.id)
      expect(result.name).to eq("Horacio")
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested company" do
      expect(fan).to be

      expect {
        delete :destroy, id: fan.id
      }.to change(Fan, :count).by(-1)

      expect(response).to redirect_to(fans_path)
      expect(flash[:notice]).to eq("The fan was deleted.")
    end
  end
end
