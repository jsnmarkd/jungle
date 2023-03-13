require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    let (:user) { User.new(:firstname => 'Jess', :lastname => 'Lopez', :email => 'JLo@lhl.ca', :password => 'password', :password_confirmation => 'password') }
    
    it 'should return an error when firstname is nil' do
      user.firstname = nil
      user.save
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end
    
    it 'should return an error when lastname is nil' do
      user.lastname = nil
      user.save
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end
    
    it 'should return an error when email is nil' do
      user.email = nil
      user.save
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'should return an error when password is nil' do
      user.password = nil
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'should return an error when password does not match confirmation' do
      user.password = 'pass'
      user.password_confirmation = 'pass1'
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should return an error when password does not meet minimum length' do
      user.password = 'pass'
      user.password_confirmation = 'pass'
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
    
    it 'should return an error when email exists in the database' do
      @user1 = User.new(:firstname => 'Jay', :lastname => 'Lopez', :email => 'TEST@TEST.com', :password => 'password', :password_confirmation => 'password')
      @user2 = User.new(:firstname => 'Riley', :lastname => 'Lopez', :email => 'test@test.COM', :password => 'password', :password_confirmation => 'password')
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    
  end

  describe '.authenticate_with_credentials' do

    let (:user) { User.new(:firstname => 'Jess', :lastname => 'Lopez', :email => 'JLo@lhl.ca', :password => 'password', :password_confirmation => 'password') }

    it 'should return nil when authentication fails' do
      user.save
      user = User.authenticate_with_credentials('JLo@lhl.ca', 'password1')
      expect(user).to eql(nil)
    end

    it 'should return the user data when authentication succeeds' do
      user.save
      user = User.authenticate_with_credentials('JLo@lhl.ca', 'password')
      expect(user).not_to eql(nil)
    end
    
    it 'should return the user data when authentication succeeds with case sensitivity' do
      user.save
      user = User.authenticate_with_credentials('jlo@lhl.ca', 'password')
      expect(user).not_to eql(nil)
    end
    
    it 'should return the user data when authentication succeeds with leading and trailing whitespaces' do
      user.save
      user = User.authenticate_with_credentials(' JLo@lhl.ca ', 'password')
      expect(user).not_to eql(nil)
    end

  end

end
