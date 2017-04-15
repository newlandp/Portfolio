class AddPortfolioItemRefToTechnologies < ActiveRecord::Migration[5.0]
  def change
    add_reference :technologies, :portfolio_item, foreign_key: true
  end
end
