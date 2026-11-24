User.destroy_all

User.create!(
  email: "tommy@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  email: "kate@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  email: "greg@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)
