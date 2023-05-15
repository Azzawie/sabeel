puts 'Creating new permissions if it does not exist already.'

Permission.resources.each do |resource|
  puts "\t Resource: #{resource}"

  Permission::ACTIONS.each do |action|
    puts "\t\t Action: #{action} "
    Permission.where(resource_name: resource, action_name: action).first_or_create!
  end
end
