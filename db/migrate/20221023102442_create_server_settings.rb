class CreateServerSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :server_settings do |t|
      t.text :domains
      t.timestamps
    end
  end
end
