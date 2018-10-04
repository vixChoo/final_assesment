class CreateTestJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :test_jobs do |t|
      t.integer :job_id
      t.integer :testing_id

      t.timestamps
    end
  end
end
