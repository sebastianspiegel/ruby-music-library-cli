class Artist 
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs, :genre 

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save 
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
      end
    
      def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
      end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(name)
        Artist.new(name)
    end

    def songs
        Song.all
    end

    def genres
        Genre.all 
    end

    def add_song(song)
        song.artist = self unless song.artist 
        @songs << song unless songs.include?(song)
    end

    def self.destroy_all
        @@all.clear
    end
end
