class AddActs < ActiveRecord::Migration[7.0]
  def change
    create_table :acts do |t|
      t.string :act_data
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
