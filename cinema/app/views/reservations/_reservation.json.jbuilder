json.extract! reservation, :id, :user_name, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
