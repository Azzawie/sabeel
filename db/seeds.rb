puts 'Creating new permissions if it does not exist already.'

Permission.resources.each do |resource|
  puts "\t Resource: #{resource}"

  Permission::ACTIONS.each do |action|
    puts "\t\t Action: #{action} "
    Permission.where(resource_name: resource, action_name: action).first_or_create!
  end
end

user = User.new(
  email: 'This_is_test_email@test.com',
  fname: 'Super',
  lname: 'User',
  phone: '8728069376',
  password: '123123',
  password_confirmation: '123123'
)
user.save!

Permission.all.each do |permission|
  UserPermission.create(user_id: user.id, permission_id: permission.id)
end

10.times do |i|
  c = Chamber.create!(name: "Chamber-#{i}", description: "description-for-#{i}")
  c.daily_statements.create(
    age_days: i,
    age_weeks: i,
    consumed_food: i,
    consumed_water: i,
    daily_production: i,
    deceased: i,
    highest_temp: i,
    humidity_ratio: i,
    lowest_temp: i,
    production_ratio: i,
    remaining: i,
    total_count: i
  )
end
