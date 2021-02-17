class CreateGroupEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :group_events do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
