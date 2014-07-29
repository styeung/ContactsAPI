class CreateContactGroups < ActiveRecord::Migration
  def change
    create_table :contact_groups do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index(:contact_groups, [:name, :user_id], :unique => true)
  end
end
