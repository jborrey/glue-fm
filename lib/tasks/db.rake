namespace :db do
  desc "Seed the DB with test data."
  task seed: :environment do
    require_relative '../../db/seed'
  end
end
