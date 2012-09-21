class CreateTodos < ActiveRecord::Migration
  def up
    create_table :todos do |t|
      t.string :name
      t.text :text

      t.datetime :due_on
      t.datetime :complited_at
    end
  end

  def down
    drop_table :todos
  end
end
