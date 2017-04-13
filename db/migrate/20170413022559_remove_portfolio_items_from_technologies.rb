class RemovePortfolioItemsFromTechnologies < ActiveRecord::Migration[5.0]
  remove_column :technologies, :portfolio_items_id
end
