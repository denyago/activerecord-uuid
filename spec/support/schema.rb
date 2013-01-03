require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Base.silence do
  ActiveRecord::Migration.verbose = false

  ActiveRecord::Schema.define do
    create_table :users, force: true do |t|
      t.integer :id
      t.string  :uuid
      t.string  :name
    end
  end
end

