class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :news_url
      t.string :news_style

      t.timestamps null: false
    end
  end
end
