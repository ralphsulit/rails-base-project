require 'rails_helper'

RSpec.describe User, type: :model do

  context 'User schema validations' do
  it "is invalid due to blank email" do
    user = User.new(email: "", username: 'tester', password: "test123")
    user.save

    expect(user.errors.full_messages).to eq(["Email can't be blank"])
  end

  it "is invalid due to incorrect email format" do
    user = User.new(email: "nono", username: 'tester', password: "")
    user.save

    expect(user.errors.full_messages.first).to eq("Email is invalid")
  end

  it "is invalid due to lack of password" do
    user = User.new(email: "Tester@test.com", username: 'tester', password: "")
    user.save

    expect(user.errors.full_messages).to eq(["Password can't be blank"])
  end

  it "is invalid, password didn't meet character minimum requirements" do
    user = User.new(email: "Tester@test.com", username: 'tester', password: "nono")
    user.save

    expect(user.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"])
  end

  it "met all criteria and is valid" do
    user = User.new(email: "Tester@test.com", username: 'tester', password: "testingPw")
    user.save

    expect(user.errors).to be_empty
  end

end

  context "Connection on other databases" do

    it "has default credit of 550,000 upon registration" do
      user = User.new(email: "Tester@test.com", username: 'tester', password: "testing123")
      user.save
  
      expect(user.wallet.balance).to eq(550000.0)
    end

    it { should have_many(:holdings) }
    it { should have_many(:trade_logs) }
    it { should have_one(:wallet) }

  end

end
