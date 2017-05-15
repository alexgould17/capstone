class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.integer :type
      t.string :uri, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.float :aspect_ratio
      t.text :tags

      t.timestamps
    end
  end
end
