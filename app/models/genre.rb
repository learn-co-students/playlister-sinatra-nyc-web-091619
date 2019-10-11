class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def self.find_by_slug(slug_to_find)
        self.all.find do |genre|
            slug_to_find == Slugifiable.slug(genre.name)
        end
    end

    def slug
        Slugifiable.slug(self.name)
    end
end