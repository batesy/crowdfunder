class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
