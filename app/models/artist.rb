require_relative "../../config/environment.rb"
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def self.find_by_slug(slug_to_find)
        self.all.find do |artist|
            slug_to_find == Slugifiable.slug(artist.name)
        end
    end

    def slug
        Slugifiable.slug(self.name)
    end

end