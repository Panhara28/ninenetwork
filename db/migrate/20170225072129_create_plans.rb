class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.string :banwidth
      t.string :connection
      t.string :support
      t.string :freebie

      t.timestamps
    end
  end
end
