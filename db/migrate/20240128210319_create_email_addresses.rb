class CreateEmailAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :email_addresses do |t|
      t.integer :owner
      t.text :email_address

      t.timestamps
    end
  end
end
