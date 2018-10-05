class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :semester
      t.integer :section_number
      t.string :room_number
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
