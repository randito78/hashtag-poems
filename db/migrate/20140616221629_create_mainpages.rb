class CreateMainpages < ActiveRecord::Migration
  def change
    create_table :mainpages do |t|
      t.string :Hashtags

      t.timestamps
    end
  end
end
