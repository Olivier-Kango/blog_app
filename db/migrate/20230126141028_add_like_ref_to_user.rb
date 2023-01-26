class AddLikeRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :authorld, null: false, foreign_key: true
  end
end
