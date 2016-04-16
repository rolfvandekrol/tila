class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :tail_length

      t.timestamps null: false
    end
  end
end
