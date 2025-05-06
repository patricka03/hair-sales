p 'Deleting the database'
Hair.destroy_all
User.destroy_all

p 'Creating a new user'

admin_user = User.new(
  first_name: "Patrick",
  last_name: "Amfo",
  date_of_birth: Date.new(1995, 6, 20),
  phone_number: "0755",
  address: "323 Kennington Lane, London, SE16 2XB",
  email: "junior.amfo@gmail.com",
  password: "password"
)

admin_user.save!

p 'Creating hair'

admin_hair = Hair.create!(
  price: 180,
  length: 14,
  texture: "Straight",
  origin: "Brazilian",
  quantity: 5,
  admin: admin_user
)

admin_hair.save!
