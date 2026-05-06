class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.references :team, null: false, foreign_key: true
      t.string :email, null: false
      t.integer :role, default: 0, null: false

      t.timestamps
    end

    add_index :invitations, [:team_id, :email], unique: true
  end
end
