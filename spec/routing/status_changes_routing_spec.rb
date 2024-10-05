require "rails_helper"

RSpec.describe StatusChangesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/status_changes").to route_to("status_changes#index")
    end

    it "routes to #new" do
      expect(get: "/status_changes/new").to route_to("status_changes#new")
    end

    it "routes to #show" do
      expect(get: "/status_changes/1").to route_to("status_changes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/status_changes/1/edit").to route_to("status_changes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/status_changes").to route_to("status_changes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/status_changes/1").to route_to("status_changes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/status_changes/1").to route_to("status_changes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/status_changes/1").to route_to("status_changes#destroy", id: "1")
    end
  end
end
