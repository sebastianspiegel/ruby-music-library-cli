class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path 
    end

    def files
        Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/", "") }
    end

    def self.import 
        files.each {|song| Song.new_by_filename }
    end

end
