class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :hashtags

      t.timestamps
    end
  end
end
