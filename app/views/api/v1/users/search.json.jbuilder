json.array! @matching_users do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :phone_no, :interests
end
