class Client < ApplicationRecord
  has_one :client_detail
  hnas_many :client_contacts
end
