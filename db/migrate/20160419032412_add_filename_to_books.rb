class AddFilenameToBooks < ActiveRecord::Migration
  def change
     add_column :books, :Image_Filename, :string
     add_column :books, :Image_Format, :string
  end
end
