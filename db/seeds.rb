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

1.upto(10) do |i|
  c = Chamber.create!(name: "Chamber-#{i}", description: "description-for-#{i}")
  1.upto(10) do |ds|
    c.daily_statements.create(
      age_days: ds,
      age_weeks: ds,
      consumed_food: ds,
      consumed_water: ds,
      daily_production: ds,
      deceased: ds,
      highest_temp: ds,
      humidity_ratio: ds,
      lowest_temp: ds,
      production_ratio: ds,
      remaining: ds,
      total_count: ds
    )
  end
end
