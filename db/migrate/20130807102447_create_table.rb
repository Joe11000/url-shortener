class CreateTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string      :long_url
      t.string      :short_url
      t.integer     :click_counter
      t.timestamps
    end
  end
end
