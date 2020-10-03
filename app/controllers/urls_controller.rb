class UrlsController < ApplicationController
  before_action :set_url, only: [:get_short_url]
  before_action :set_url_by_short_url, only: [:short_url, :stats]

  # Return short_url
  def get_short_url
    if @url
      render json: { short_url: @url.short_url.to_json, status: 200}
    else
      render json: { status: :unprocessable_entity }
    end
  end

  # Find by :short_url and increment stats
  def short_url
      if @url
        @url.incr
        render json: { url: @url.link, status: 200}
      else
        render json: { status: :unprocessable_entity }
      end
  end

  def stats
    if @url
      render json: { stats: @url.stats.to_json, status: 200}
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private
    # Find by link
    def set_url
      @url = Url.find_by_link(params[:link]) if params[:link].present?
    end

    #Find by find_by_short_url
    def set_url_by_short_url
      @url = Url.find_by_short_url(params[:short_url]) if params[:short_url].present?
    end
end
