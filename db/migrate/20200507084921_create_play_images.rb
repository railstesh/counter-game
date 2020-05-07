class CreatePlayImages < ActiveRecord::Migration[5.2]
  def change
    create_table :play_images do |t|

      t.timestamps
    end
  end
end
