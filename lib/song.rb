class Song
  
  attr_accessor :artist, :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @artist 
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    artist_name, song_name = filename.split(" - ")
    new_artist = Artist.new(artist_name)
    new_song = self.new(song_name)
    new_song.artist = new_artist
    new_artist.add_song(new_song)
    new_song
  end
  
  def artist_name=(artist_name)
    artist = Artist.all.find do |artist| 
      artist.name == artist_name 
    end
    @artist = artist ? artist : Artist.new(artist_name)
  end
  
end