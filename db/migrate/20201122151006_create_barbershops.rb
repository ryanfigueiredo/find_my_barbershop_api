class CreateBarbershops < ActiveRecord::Migration[6.0]
  def change
    create_table :barbershops do |t|
      t.string :name
      t.string :address
      t.string :google_place_id
      t.st_point :lonlat, geographic: true

      t.timestamps
    end

    add_index :barbershops, :lonlat, using: :gist
  end
end
