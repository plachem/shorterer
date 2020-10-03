class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :link
      t.string :short_url
      t.integer :stats

      t.timestamps
    end
    add_index :urls, :link, unique: true
    add_index :urls, :short_url, unique: true
  end
end
