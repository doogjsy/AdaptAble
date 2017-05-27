class CreateClientContact < ActiveRecord::Migration[5.1]
  def change
    create_table :client_contacts do |t|
      t.integer :client_id, index: true, foreign_key: true
      t.datetime :date
      t.string :type
      t.text :notes

      t.timestamps
    end
  end
end
