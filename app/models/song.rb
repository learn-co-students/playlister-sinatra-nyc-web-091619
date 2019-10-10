class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def self.find_by_slug(slug_to_find)
        self.all.find do |song|
            slug_to_find == Slugifiable.slug(song.name)
        end
    end

    def slug
        Slugifiable.slug(self.name)
    end
end