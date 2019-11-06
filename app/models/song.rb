class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year}, if: :released?
  validates :artist_name, presence: true
  validates :genre, presence: true

  def released?
    self.released == true
  end

  def to_bool(str)
    ActiveRecord::Type::Boolean.new.cast(str)
  end
 
end