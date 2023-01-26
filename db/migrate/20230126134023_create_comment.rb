class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :authorld
      t.text :postld
      t.text :text

      t.timestamps
    end
  end
end
