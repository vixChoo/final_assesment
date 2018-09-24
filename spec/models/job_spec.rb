require 'rails_helper'

RSpec.describe Job, type: :model do

    before(:each) do
      user = User.create(name: 'John sample', email: 'sample@example.com', password: 'password123')
    end

     
    context'Testing Job Model About Validation (Sad path)' do
      it "is not valid without a name" do
        job = Job.new(location:'Somewhere',price:"123456789",description:"Something",user_id:'1').save
        expect(job).to eq(false)
      end
  
      it "is not valid without a location" do
        job = Job.new(name:'XXX Company' ,price:"123456789",description:"Something",user_id:'1').save
        expect(job).to eq(false)
      end
      
      it 'ensure description presence' do
        job = Job.new(name:'XXX Company' ,location:'Somewhere',price:"123456789",user_id:'1').save
        expect(job).to eq(false)
      end
  
      it 'ensure price presence' do
        job = Job.new(name:'XXX Company' ,location:'Somewhere',description:"Something",user_id:'1').save
        expect(job).to eq(false)
      end
  
    end
  

   context 'Association' do

    it "should belong to user" do
      t = Job.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

  end

  
end
