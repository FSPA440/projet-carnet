class CreatePersonnes < ActiveRecord::Migration[6.1]
  def change
    create_table :personnes do |t|
      t.string :prenom
      t.string :nom
      t.string :profession
      t.string :telephone
      t.text :adresse

      t.timestamps
    end
  end
end
