namespace :company do
  desc 'add company'
  task run: :environment do
    seamless = Company.find_or_initialize_by(
      name: 'Seamless Creative'
    )
    seamless.address = 'Jakarta'
    seamless.latitude = -6.1751
    seamless.longitude = 106.8294
    seamless.save!
  end
end
