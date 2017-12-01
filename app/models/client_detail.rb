class ClientDetail < ApplicationRecord
  belongs_to :client

  def address_to_s
    [housename, street_name, street_name_2, parish, island].reject(&:blank?).compact.join('<br>')
  end
end
