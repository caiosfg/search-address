json.extract! adress, :id, :title, :description, :location, :created_at, :updated_at
json.url adress_url(adress, format: :json)
