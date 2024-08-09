class CreateNewsItems < ActiveRecord::Migration[7.1]
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
