class GenresController < ApplicationController

    get '/genres' do
        @genres = Genre.all

        erb :'/genres/index'
    end

    get '/genres/:slug' do
        @genre= Genre.find_by_slug(params[:slug])
        @songs = @genre.songs
        @artists = @songs.map {|song| song.artist}.uniq
        erb :'/genres/show'
    end

end