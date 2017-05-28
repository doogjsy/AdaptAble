class ChangeTypeColumnToContactType < ActiveRecord::Migration[5.1]
  def change
    rename_column :client_contacts, :type, :contact_type
  end
end
