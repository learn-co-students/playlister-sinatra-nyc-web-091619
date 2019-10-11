
class Slugifiable

    def self.slug(stg)
        lowercase = stg.downcase.strip
        no_special = lowercase.gsub(/[^\w ]/, '')
        no_spaces = no_special.gsub(' ','-')
        no_double = no_spaces.gsub('--', '-')
     
    end
    
end