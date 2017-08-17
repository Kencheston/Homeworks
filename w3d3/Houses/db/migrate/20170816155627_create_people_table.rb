class CreatePeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people_tables do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
