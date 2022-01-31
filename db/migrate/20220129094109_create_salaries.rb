class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer :amount
      t.integer :year
      t.string :job_title
      t.integer :remote
      t.integer :flex
      t.boolean :equity
      t.integer :workweek
      t.integer :overtime

      t.timestamps
    end
  end
end
