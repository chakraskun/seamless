namespace :dummies do
  desc 'add user login'
  task create_user: :environment do
    user = User.find_or_initialize_by(
      email: 'test@gmail.com'
    )
    user.name = 'Test User Name'
    user.username = 'test username'
    user.password = 'password'
    user.company_id = Company.first.id
    user.save!
  end
end
