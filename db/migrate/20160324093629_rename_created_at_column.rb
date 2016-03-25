class RenameCreatedAtColumn < ActiveRecord::Migration

  def change
rename_column :articles, :created_add, :created_at
rename_column :articles, :updated_add, :updated_at
  end
end
