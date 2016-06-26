class AddUserToNews < ActiveRecord::Migration
  def change
    add_reference :news, :user, index: true, foreign_key: true
  end
end
