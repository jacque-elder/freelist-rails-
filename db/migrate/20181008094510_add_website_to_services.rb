class AddWebsiteToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :website, :string
  end
end
