class Client < ApplicationRecord
  has_one :client_detail
  has_many :client_contacts

  def full_name
    first_name + ' ' + last_name
  end
end
