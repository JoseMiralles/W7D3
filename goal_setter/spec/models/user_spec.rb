require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}

  describe 'uniqueness' do
    before(:each) do
      create(:user)
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "#is_password?" do 
    # let! vs let
    # let! will execute before each `it` block (kind of like an implict before(:each))
    # let will execute only when the variable is used
    # relevant for efficiency (which isn't our first priority, but is not unimportant)
    let!(:user) { create(:user) }
    context "with a valid password" do
        it "should return true" do 
            user.username
            expect(user.is_password?('onering')).to be true
        end
    end

    context "with an invalid password" do 
        it "should return false" do 
            user.username
            expect(user.is_password?('tworings?')).to be false
          end
      end
  end

  

end