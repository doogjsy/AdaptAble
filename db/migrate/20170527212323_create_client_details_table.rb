class CreateClientDetailsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :client_details do |t|
      t.integer :client_id, index: true, foreign_key: true
      t.string :housename
      t.string :street_name
      t.string :street_name_2
      t.string :parish
      t.string :island
      t.string :email
      t.string :landline
      t.string :mobile

      t.timestamps
    end
  end
end
