require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/status_changes", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # StatusChange. As you add validations to StatusChange, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      StatusChange.create! valid_attributes
      get status_changes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      status_change = StatusChange.create! valid_attributes
      get status_change_url(status_change)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_status_change_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      status_change = StatusChange.create! valid_attributes
      get edit_status_change_url(status_change)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new StatusChange" do
        expect {
          post status_changes_url, params: { status_change: valid_attributes }
        }.to change(StatusChange, :count).by(1)
      end

      it "redirects to the created status_change" do
        post status_changes_url, params: { status_change: valid_attributes }
        expect(response).to redirect_to(status_change_url(StatusChange.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new StatusChange" do
        expect {
          post status_changes_url, params: { status_change: invalid_attributes }
        }.to change(StatusChange, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post status_changes_url, params: { status_change: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested status_change" do
        status_change = StatusChange.create! valid_attributes
        patch status_change_url(status_change), params: { status_change: new_attributes }
        status_change.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the status_change" do
        status_change = StatusChange.create! valid_attributes
        patch status_change_url(status_change), params: { status_change: new_attributes }
        status_change.reload
        expect(response).to redirect_to(status_change_url(status_change))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        status_change = StatusChange.create! valid_attributes
        patch status_change_url(status_change), params: { status_change: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested status_change" do
      status_change = StatusChange.create! valid_attributes
      expect {
        delete status_change_url(status_change)
      }.to change(StatusChange, :count).by(-1)
    end

    it "redirects to the status_changes list" do
      status_change = StatusChange.create! valid_attributes
      delete status_change_url(status_change)
      expect(response).to redirect_to(status_changes_url)
    end
  end
end
