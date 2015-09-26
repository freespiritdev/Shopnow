class AddWomanToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :woman, index: true
  end
end
