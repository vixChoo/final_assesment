
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf123'

ActiveRecord::Base.transaction do
  5.times do 
    user['name'] = Faker::Name.name 
    user['email'] = Faker::Internet.email
    User.create(user)
  end  
end   
    
    
    

job = {}
uids = [] #user_id
User.all.each { |u| uids << u.id }


ActiveRecord::Base.transaction do
  20.times do 
    job['name'] = Faker::App.name
    job['location'] = Faker::Address.street_address
    job['price'] = rand(80..500)
    job['description'] = Faker::Hipster.sentence
    job['user_id'] = uids.sample
    Job.create(job)
   end
end

