class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :title
      t.integer :age
      t.integer :phone
      t.string :email
      t.timestamps
    end
  end
end
