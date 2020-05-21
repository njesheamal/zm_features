#can have many (lots of) info
#belongs to an artist
#keeps track of all the features

class Feature
    attr_accessor :artist, :info, :name
    @@all = []

    def initialize(name, info)
        @name = name
        @info = info
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        self.artist.name
    end

    def blurbs
        Info.all.select { |info| info.feature == self}
    end

    def add_info(info)
        info.feature = self
    end

    def add_info_by_name(name)
        info = Info.new()
end
