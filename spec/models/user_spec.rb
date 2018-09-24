require 'rails_helper'

RSpec.describe User, type: :model do
 context'Testing User Model About Validation (Happy path)' do

  it 'should successfully with all attributes' do
    user = User.new( name:'Mr.Sample' ,email:'sample@email.com',password:"123456789").save
    expect(user).to eq(true)
  end

  it 'should successfully without email ONLY FOR OMNIAUTH' do
    user = User.new( name:'Mr.Sample',password:"123456789").save
    expect(user).to eq(true)
  end

end
  

  context'Testing User Model About Validation (Sad path)' do
    it "is not valid without a name" do
      user = User.new(email:'sample@email.com',password:"abc123123").save
      expect(user).to eq(false)
    end
    
    it 'ensure user password presence' do
      user = User.new(name:'Last',email:'sample@email.com').save
      expect(user).to eq(false)
    end
  end

  
    
  context 'Association' do

    it "should have many jobs" do
      t = User.reflect_on_association(:jobs)
      expect(t.macro).to eq(:has_many)
    end
  
  end

 
end
