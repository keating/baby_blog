class AddViewTimesToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :view_times, :integer
  end
end
