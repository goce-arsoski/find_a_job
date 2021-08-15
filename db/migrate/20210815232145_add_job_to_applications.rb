class AddJobToApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :applications, :job, foreign_key: true
  end
end
