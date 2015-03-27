class Review < ActiveRecord::Base
  RATING = [1, 2, 3, 4, 5]

  validates :rating, presence:true
  #  inclusion: { in: %w ( 1 2 3 4 5 ), message: "Rating must be on a 1-5 scale"}

  belongs_to :restaurant

end
