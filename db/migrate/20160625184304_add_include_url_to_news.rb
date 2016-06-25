class AddIncludeUrlToNews < ActiveRecord::Migration
  def change
    add_column :news, :include_url, :boolean
  end
end
