class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :emp_name
      t.string :emp_email
      t.string :category
      t.datetime :expire_period

      t.timestamps
    end
  end
end
