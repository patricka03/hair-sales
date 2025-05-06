p 'Deleting the database'
Hair.destroy_all
User.destroy_all

p 'Creating the admin user'

admin_user = User.new(
  first_name: "Patrick",
  last_name: "Amfo",
  date_of_birth: Date.new(1995, 6, 20),
  phone_number: "0755",
  address: "323 Kennington Lane, London, SE16 2XB",
  email: "junior.amfo@gmail.com",
  password: "password",
  admin: true
)

admin_user.save!

p 'Creating hair'

file = File.open('/Users/patrickamfo/code/patricka03/hair-sales/app/assets/images/SeamlessClipins-BodyWave_74241c2b-1ce7-4508-b7cd-6fa77e420659.jpg')

admin_hair = Hair.new(
  name: "testhair",
  price: 180,
  length: 20,
  texture: "Loose Wave",
  origin: "Brazilian",
  quantity: 5,
)

admin_hair.admin = admin_user
admin_hair.photo.attach(io: file, filename: 'Seamless', content_type:"image/png")
admin_hair.save
p 'Hair and Admin user created'
