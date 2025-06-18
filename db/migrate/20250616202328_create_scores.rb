class CreateScores < ActiveRecord::Migration[8.0]
  def change
    create_table :scores do |t|
      t.string :reg_num
      t.float :math
      t.float :literature
      t.float :f_language
      t.float :physic
      t.float :chem
      t.float :biology
      t.float :history
      t.float :geo
      t.float :ce
      t.string :f_language_id

      t.timestamps
    end
  end
end
