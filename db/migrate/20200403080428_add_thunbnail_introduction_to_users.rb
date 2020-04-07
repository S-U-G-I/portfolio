class AddThunbnailIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :thumbnail, :text
    add_column :users, :introduction, :string,  default: "よろしくお願いします！"
  end
end
