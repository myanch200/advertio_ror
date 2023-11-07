class Listing < ApplicationRecord
  monetize :price_cents
  has_rich_text :description

  validates :price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
