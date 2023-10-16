require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  before(:each) do
  end

  describe 'Check User valid or not' do    
    it 'Should be valid user with all attributes' do
      user.valid? == true
    end
  end
  
  describe 'able to Create User with org_usr' do    
    it "should able to create user" do
      user = User.create(email: "abc123@gamil.com", password: "password", user_type: "org_user")
      expect(User.count).to eq(1)
      expect(user[:user_type]).to eq('org_user')
    end
    it "should able to create user with normal user" do
      user = User.create(email: "abc123@gamil.com", password: "password", user_type: "user")
      expect(User.count).to eq(1)
      expect(user[:user_type]).to eq('user')
    end
  end

  describe 'not able to Create User' do    
    it "not able to create user without password" do
      user = User.create(email: "abc123@gamil.com", password: "", user_type: "org_user")
      expect(User.count).to eq(0)
      expect(user.errors.messages[:password]).to eq(["can't be blank"])
    end
   
    it "not able to create user without invalid email" do
      user = User.create(email: "abc123@gamil.@com", password: "password", user_type: "org_user")
      expect(User.count).to eq(0)
      expect(user.errors.messages[:email]).to eq(["is invalid"])
    end
    
    it "not able to create user without email" do
      user = User.create(email: "", password: "password", user_type: "org_user")
      expect(User.count).to eq(0)
      expect(user.errors.messages[:email]).to eq(["can't be blank"])
    end
    
    it "not able to create user without email and password" do
      user = User.create(email: "", password: "", user_type: "org_user")
      expect(User.count).to eq(0)
      expect(user.errors.messages[:email]).to eq(["can't be blank"])
      expect(user.errors.messages[:password]).to eq(["can't be blank"])
    end

    it "not able to create user, if password is short like less than 6 charters" do
      user = User.create(email: "abc123@gamil.com", password: "pass", user_type: "org_user")
      expect(User.count).to eq(0)
      expect(user.errors.messages[:password]).to eq(["is too short (minimum is 6 characters)"])
    end

    it "not able to create user without user_type" do
      User.create(email: "abc123@gamil.com", password: "password", user_type: "")
      expect(User.count).to eq(0)
    end
  end
end
