class CreateShippingAdds < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_adds do |t|
      t.references :order,             null: false, foreign_key: true 
      t.string     :postal_code,       null: false
      t.integer    :prefecture_id,     null: false
      t.string     :city,              null: false
      t.string     :address_line_main, null: false
      t.string     :address_line_sub
      t.string     :phone_number,      null: false
      t.timestamps
    end
  end
end

