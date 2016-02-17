class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.date :due_date
      t.boolean :finished
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
