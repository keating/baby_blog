class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :limit => 200
      t.string :content, :limit => 20000
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
