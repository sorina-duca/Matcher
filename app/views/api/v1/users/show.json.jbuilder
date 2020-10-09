json.extract! @user, :id, :first_name, :last_name, :interests

json.matching_interests_number @matching_interests.size
json.matching_interests @matching_interests

unless @matching_times.size.zero?
  json.matching_times @matching_times do |time|
    json.start time.start
    json.end time.end
  end
end
