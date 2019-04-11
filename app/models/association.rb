class Association < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  belongs_to :song
end
