class Client < ApplicationRecord
  has_one :client_detail
  has_many :client_contacts

  accepts_nested_attributes_for :client_detail

  def full_name
    first_name + ' ' + last_name
  end
end
