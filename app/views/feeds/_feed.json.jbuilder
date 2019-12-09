json.extract! feed, :id, :text, :picture, :time, :reported, :created_at, :updated_at
json.url feed_url(feed, format: :json)
