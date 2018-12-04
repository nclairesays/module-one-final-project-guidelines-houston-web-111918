class CreateNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :numbers do |t|
      t.integer :int_num 
      t.string :alpha_num
    end
  end
end
