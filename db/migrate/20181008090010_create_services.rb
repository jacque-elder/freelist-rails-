class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :website
      t.string :name
      t.string :price
      t.string :image
      t.string :description
      t.string :email
      t.string :website
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
