class CreateCacas < ActiveRecord::Migration[5.2]
  def change
    create_table :cacas do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true

      t.timestamps
    end
  end
end
