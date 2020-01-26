json.extract! comment, :id, :reply, :posted, :created_at, :updated_at
json.url comment_url(comment, format: :json)
