class RemoveImageFromBlog < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :image, :string
  end
end
