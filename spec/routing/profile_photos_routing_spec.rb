require "rails_helper"

RSpec.describe ProfilePhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/profile_photos").to route_to("profile_photos#index")
    end

    it "routes to #show" do
      expect(get: "/profile_photos/1").to route_to("profile_photos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/profile_photos").to route_to("profile_photos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/profile_photos/1").to route_to("profile_photos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/profile_photos/1").to route_to("profile_photos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/profile_photos/1").to route_to("profile_photos#destroy", id: "1")
    end
  end
end
