class Genre
    extend Concerns::Findable
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save 
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(name)
        Genre.new(name)
    end

    def songs
        Song.all
    end

    def artists
        Artist.all 
    end

    def self.destroy_all
        @@all.clear
    end
end
