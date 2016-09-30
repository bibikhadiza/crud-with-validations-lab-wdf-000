class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :valid_release_year?
  validate :artist_song?



  def valid_release_year?
    if released && !release_year
      errors.add(:release_year, "must add release year")
    end

    if !released && release_year
      errors.add(:released, "must change boolean")
    end

    if release_year && release_year > Time.now.year
      errors.add(:release_year, "Released year cannot be in the future")
    end
  end


  def artist_song?
    found = Song.all.any? do |song|
      song.title == self.title && song.artist_name == self.artist_name && self.release_year == song.release_year
    end

    if found
      errors.add(:artist_name, "this artist has already created this song this year")
    end
  end



  #you need to look up your iterators. for valid_release_year we start up by first
  #with a true or false value, if the release year is not true and the relased is true then the
  #if condition is false and therefor the error message is added that the release year much be added.

  #if there is a release year but the released boolean is false then the if statement will be false because both are not true. we then add a custom error message

  #if the release year is true and the there is a release year (because you cant compare if it does not exist) and
  #the release year is more the the time now then we add a custom error message.

  #remember if is always looking for a true or false





  #with the def artist_song method rememeber the any iterator returns true or false so if my my test is found
  #then the found var which is holding the logic of true or false is compared with if condition. if its true then I
  #add the error message















end
