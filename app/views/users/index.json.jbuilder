json.array!(@users) do |user|
  json.extract! user, :id, :firstName, :lastName, :email, :contactNumber, :streeAddress, :city, :province, :postalCode, :country, :userId
  json.url user_url(user, format: :json)
end
