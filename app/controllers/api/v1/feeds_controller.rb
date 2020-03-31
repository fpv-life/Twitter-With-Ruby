class Api::V1::FeedsController < ActionController::API
  def index
    feeds = Feed.all
    feeds = feeds.map do |feed|
      { id: feed.id, text: feed.text, picture: feed.picture, time: feed.time, reported: feed.reported, user_id: feed.user.id }
    end

    render json: { results: feeds }.to_json, status: :ok
  end
end
