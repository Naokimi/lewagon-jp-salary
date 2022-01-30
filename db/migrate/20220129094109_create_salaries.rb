class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer :amount
      t.datetime :graduation
      t.string :role_name
      t.integer :remote
      t.integer :flex
      t.boolean :equity, default: false
      t.integer :workweek
      t.integer :overtime

      t.timestamps
    end
  end
end
