class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null:false
      t.string :description
      t.belongs_to :restaurant

      t.timestamp
    end
  end
end
