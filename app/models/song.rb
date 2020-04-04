class Song < ActiveRecord::Base
belongs_to :artist
belongs_to :genre
has_many :notes
attr_accessor :name
def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end 
def artist_name
  artist.try(:name)
end
end
