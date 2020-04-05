class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  # add associations here
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.try(:name)
  end
  # add associations here
end
