User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  description = (Faker::Lorem.sentences(5)).join(' ')
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number
  price = Faker::Commerce.price
  name = Faker::Company.profession
  website = "#{Faker::Lorem.word}.com"
  image = Faker::Placeholdit.image
  users.each { |user| user.services.create!(description: description, 
                                            email: email, 
                                            phone: phone, 
                                            price: price, 
                                            name: name, 
                                            website: website, 
                                            image: image) }
end