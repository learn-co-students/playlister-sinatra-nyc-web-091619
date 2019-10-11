class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb:'/artists/index'
    end

    def '/artists/:slug' do
        @artists = Artist.find_by_slug(params[:slug])
        @songs = @artist.songs
        @genres = @songs.map {|song| song.genres}.flatten.uniq
        
        erb :'/artists/show'
    end
    
end
