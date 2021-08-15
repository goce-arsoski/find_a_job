class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :full_name
      t.date :birth
      t.string :email
      t.string :phone
      t.string :address
      t.string :education

      t.timestamps
    end
  end
end
