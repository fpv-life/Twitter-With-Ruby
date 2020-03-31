class Api::V1::FeedsController < ActionController::API
  before_action :set_feed, only: [:index, :edit, :update, :destroy]
  set_before_action :authenticate_request, only: [:index]

  def index
    feeds = Feed.all
    feeds = feeds.map do |feed|
      { id: feed.id, text: feed.text, picture: feed.picture, time: feed.time, reported: feed.reported, user_id: feed.user_id }
    end

    render json: { results: feeds }.to_json, status: :ok
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = @current_api_user
    if @feed.save
      render json: { result: @feed }.to_json, status: :ok
    else
      render json: { result: @feed.errors }.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    if @feed
      @feed.destroy
      render json: { message: "Feed was successfully destroyed." }.to_json, status: :ok
    else
      render json: { error: "Feed was not successfully destroyed." }.to_json, status: :error
    end
  end

  def update
    if @feed
      @feed.update(feed_params)
      render json: { result: @feeds }.to_json, status: :ok
    else
      render json: { result: @feeds.errors }.to_json, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.permit(:text, :time, :reported, :image)
  end
end
