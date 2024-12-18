class PlaylistsController < ApplicationController
  def index
  end

  def fetch_tracks
    begin
      playlist_url = params[:playlist_url]
      playlist_id = playlist_url.split('/').last.split('?').first
      playlist = RSpotify::Playlist.find_by_id(playlist_id)

      tracks = playlist.tracks.map do |track|
        {
          name: track.name,
          artist: track.artists.first.name
        }
      end

      render json: { tracks: tracks }
    rescue => e
      render json: { error: "Could not fetch playlist: #{e.message}" }, status: :unprocessable_entity
    end
  end
end
