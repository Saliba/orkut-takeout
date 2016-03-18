require 'rails_helper'

describe SignInController do
   it "should redirect to social network 1" do
     get :export, export: "social_network_1"
     expect(response.status).to eq(302)
     expect(response.request.fullpath).to eq("/export?export=social_network_1")
   end
   it "should redirect to social network 2" do
     get :export, export: "social_network_2"
     expect(response.status).to eq(302)
     expect(response.request.fullpath).to eq("/export?export=social_network_2")
   end
   it "should redirect to social network 3" do
     get :export, export: "social_network_3"
     expect(response.status).to eq(302)
     expect(response.request.fullpath).to eq("/export?export=social_network_3")
     end
   it "should raise a error on social network 4" do
     expect { get :export }.to raise_error(ActiveRecord::RecordNotFound)
   end
end







