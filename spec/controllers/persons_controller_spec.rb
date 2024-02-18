require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
  let(:valid_attributes) { attributes_for(:person) }
  let(:invalid_attributes) { attributes_for(:person, name: '') }

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Person" do
        expect {
          post :create, params: { person: valid_attributes }
        }.to change(Person, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Person" do
        expect {
          post :create, params: { person: invalid_attributes }
        }.to change(Person, :count).by(0)
      end
    end
  end
  
  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { attributes_for(:person, name: 'Updated Name') }

      it "updates the requested person" do
        person = create(:person)
        patch :update, params: { id: person.to_param, person: new_attributes }
        person.reload
        expect(person.name).to eq('Updated Name')
      end

      it "redirects to the person" do
        person = create(:person)
        patch :update, params: { id: person.to_param, person: new_attributes }
        expect(response).to redirect_to(person)
      end
    end
  end
end
