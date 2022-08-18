class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest
      t.string :role, null: false, default: "staff"
      t.datetime :last_login
      t.timestamps
    end
  end
end
