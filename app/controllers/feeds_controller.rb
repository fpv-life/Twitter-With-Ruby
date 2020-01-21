class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy, :report, :pardon]

  def upvote
    @feed = Feed.find(params[:id])
    @feed.liked_by current_user
    redirect_to root_path
  end
  
  def downvote
    @feed = Feed.find(params[:id])
    @feed.downvote_from current_user
    redirect_to root_path
  end

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
    @user = current_user
    @feed = Feed.new
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)
    @feed.user = current_user
    @feed.image.attach(params[:feed][:image])
    respond_to do |format|
      if @feed.save
        format.html { redirect_to root_path, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    @feed.image.purge
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    @feed.reported = "true"
    @feed.save
  end

  def pardon
    @feed.reported = "none"
    @feed.save
    redirect_to admin_root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:text, :picture, :time, :reported, :image)
    end
end
