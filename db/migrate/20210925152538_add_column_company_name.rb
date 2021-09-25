class AddColumnCompanyName < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :company_name, :string
  end
end
