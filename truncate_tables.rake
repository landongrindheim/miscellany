namespace :db do
  desc "Raise exception if used in environment other than development"
  task :check_environment => :environment do
    raise "This task is only available in the development environment" unless Rails.env.development?
  end


  desc "Truncates model tables"
  task :truncate => :check_environment do
    begin
      ActiveRecord::Base.establish_connection
      ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS=0")
      ActiveRecord::Base.connection.tables.each do |table|
        unless table == "schema_migrations"
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
        end
      end
    ensure
      ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS=1")
    end
  end
end
