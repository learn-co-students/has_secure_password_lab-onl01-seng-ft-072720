User.destroy_all

User.create!(name: "Zach", password: "pass", password_confirmation: "pass")
User.create!(name: "dave", password: "dave", password_confirmation: "dave")
User.create!(name: "newguy", password: "coolpass", password_confirmation: "coolpass")