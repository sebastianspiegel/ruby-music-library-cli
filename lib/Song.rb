class Song
    attr_accessor :name
    attr_reader :artist, :genre 

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save 
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre 
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(name)
        Song.new(name)
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
       self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        file = filename.split(" - ")
        song = file[1]
        artist = file[0]
        genre = file[2]

        new(song, artist, genre)
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save 
    end

    def self.destroy_all
        @@all.clear
    end
end
