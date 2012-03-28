class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :albums
end
