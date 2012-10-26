class AddArticleCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :article_count, :integer, :default => 0
  end
end
