class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :ratingable_type
      t.integer :ratingable_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
