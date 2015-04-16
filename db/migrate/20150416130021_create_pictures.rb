class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :image_file_name
      t.references :gallery, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :galleries
  end
end
