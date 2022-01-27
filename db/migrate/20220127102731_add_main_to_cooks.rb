class AddMainToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :main, :text
  end
end
