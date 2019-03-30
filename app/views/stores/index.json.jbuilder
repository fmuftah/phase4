json.array!(@stores) do |store|
  json.extract! store, :id, :name, :street, :city, :state, :zip, :phone, :latitude, :longitude , :active
  json.url store_url(store, format: :json)
end

