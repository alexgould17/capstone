class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.integer :pictype
      t.string :uri, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.integer :width
      t.integer :height
      t.float :aspect_ratio
      t.text :tags

      t.timestamps
    end
  end
end
