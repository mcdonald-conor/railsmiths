class CreateSignupsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :signups do |t|
      t.string :email, null: false
      t.timestamps
    end

    add_index :signups, :email, unique: true
  end
end
