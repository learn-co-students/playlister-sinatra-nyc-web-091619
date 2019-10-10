require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    # ALL SONGS
    get '/songs' do
        @songs = Song.all
        
        erb :'/songs/index'
    end

    #NEW FORM
    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    #CREATE
    post '/songs' do
        @song = Song.create(params["song"])
        @song.artist_id = Artist.find_or_create_by(name: params["artist_name"]).id
      
        if !params["genre_ids"].empty?
            params["genre_ids"].each do |genre_id|
                SongGenre.create(song_id: @song.id, genre_id: genre_id)
            end
        end
        @song.save
        
        flash[:message] = "Successfully created song."
        redirect "/songs/#{Slugifiable.slug(@song.name)}"
        
    end

    #READ
    get '/songs/:slug' do
        @song= Song.find_by_slug(params[:slug])
        @genres = @song.genres
        @artist = @song.artist
       
        erb :'/songs/show'
    end

    #EDIT form
    get '/songs/:slug/edit' do
        @slug = params[:slug]
        @song = Song.find_by_slug(@slug)
        @genres = Genre.all

        erb :'songs/edit'
    end

    #UPDATE
    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params["song"]["name"]
        @song.artist_id = Artist.find_or_create_by(name: params["artist_name"]).id
        if !params["genre_ids"].empty?
            params["genre_ids"].each do |genre_id|
                SongGenre.find_or_create_by(song_id: @song.id, genre_id: genre_id)
            end
        end
        @song.save
     
    
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{params[:slug]}"
    end
end