class Song < ActiveRecord::Base
    require_relative "concerns/slugifiable.rb"
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

end