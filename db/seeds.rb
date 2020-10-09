require 'time'
# SEED USERS

# User.destroy_all

# 50.times do
#   user = User.create(
#     email: Faker::Internet.email,
#     password: "123456",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone_no: Faker::PhoneNumber.cell_phone_with_country_code,
#     interests: ['dancing', 'running', 'reading'].sample([1,2,3].sample)
#     )
# end

# SEED AVAILABILITIES

# 30.times do
#   availability = Availability.create(
#     start: Time.parse('September 8 18:00'),
#     end: Time.parse('September 8 20:00'),
#     status: 0,
#     user_id: User.all.sample.id
#     )
#   puts "Availability #{availability.id} has been created for #{availability.user}"
# end

30.times do
  availability = Availability.create(
    start: Time.parse('September 9 18:00'),
    end: Time.parse('September 9 20:00'),
    status: 0,
    user_id: User.all.sample.id
    )
  puts "Availability #{availability.id} has been created for #{availability.user}"
end
