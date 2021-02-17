class AddScoreToPost < ActiveRecord::Migration
  def change
    add_column :posts, :score, :decimal
  end
end
