    require 'database_cleaner/active_record'

    DatabaseCleaner.allow_production = true
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    # write your new seeds after this line

