require 'spec_helper'

describe 'User' do

  context 'validations' do
    it "is invalid without a username" do
      expect(User.create(username: nil, email: 'test@example.com', password: 'test1234')).to_not be_valid
    end

    it "is invalid without an email address" do
      expect(User.create(username: 'test user', email: nil, password: 'test1234')).to_not be_valid
    end

    it "is invalid without a password" do
      expect(User.create(username: 'test user', email: 'test@example.com', password: nil))
    end
  end

  context 'uniqness' do
    it "ensures that the username is unique" do

    end

    it "ensures that the email address is unique" do

    end
  end

  context 'attributes' do
    it "has a username" do

    end

    it "has an email address" do

    end

    it "has a password" do

    end
  end

  context "User model implemts 'slug' attribute" do
    before do
      @user = User.create(username: 'test user', email: 'test@example.com', password: 'test1234')
    end

    it "can slug the username" do
      expect(@user.slug).to eq('test-user')
    end

    it "can find a user based on the slug" do
      expect(User.find_by_slug(@user.slug).username).to eq('test user')
    end
  end

  context "authenticate" do
    it "has a secure password" do
      expect(@user.authenticate('password')).to eq(false)
      expect(@user.authenticate('test1234')).to eq(@user)
    end
  end

end
