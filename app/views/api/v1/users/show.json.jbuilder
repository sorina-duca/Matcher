json.extract! @user, :id, :first_name, :last_name, :interests


json.matching_interests @matching_interests do |interest|
  json.interest interest
end

  json.matching_times @matching_times do |time|
    json.time time
  end



