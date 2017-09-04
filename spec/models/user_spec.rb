require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should validate a fully qualified user' do 
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
    end
    it 'Should fail if passwords are different' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaas'
      )
      @user.save!
    end
    it 'Should fail if emails of different case are submitted' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
      @user2 = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'Ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user2.save!
    end
    it 'Should fail if password length is less than 6' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaa', 
        password_confirmation: 'aaaaa'
      )
      @user.save!
    end
  end
  describe '.authenticate_with_credentials' do
    it 'Should allow session creation with proper credentials' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
      expect(User.authenticate_with_credentials('ahache8@gmail.com', 'aaaaaa')).to eq(@user)
    end
    it 'Should fail to create session with improper credentials' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
      expect(User.authenticate_with_credentials('ahache8@gmail.com', 'aaaaaabbb')).to eq(@user)
    end
    it 'Should allow session creation with added whitespace' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
      expect(User.authenticate_with_credentials('   ahache8@gmail.com    ', 'aaaaaa')).to eq(@user)
    end
    it 'Should create session if email is wonky case' do
      @user = User.new(
        first_name: 'Alex', 
        last_name: 'Hache', 
        email: 'ahache8@gmail.com', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa'
      )
      @user.save!
      expect(User.authenticate_with_credentials('AhAcHE8@gmaiL.cOM', 'aaaaaa')).to eq(@user)
    end
  end
end
