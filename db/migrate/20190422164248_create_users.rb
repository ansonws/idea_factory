class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, index: { unique: true }
      t.string :email, index: { unique: true }
      t.string :password_digest

      t.timestamps
    end
  end
end
