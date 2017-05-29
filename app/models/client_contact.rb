class ClientContact < ApplicationRecord
  belongs_to :client
  validates(
    :date,
    :contact_type,
    :notes,
    presence: true
  )
end
