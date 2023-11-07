json.extract! listing, :id, :name, :description, :price_cents, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s
