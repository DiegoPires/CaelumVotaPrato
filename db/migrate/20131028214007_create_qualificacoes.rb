class CreateQualificacoes < ActiveRecord::Migration
  def change
    create_table :qualificacoes do |t|
      t.integer :cliente_id
      t.integer :restaurante_id
      t.float :nota
      t.float :valor_gasto

      add_index(:qualificacao, :cliente_id)
      add_index(:qualificacao, :restaurante_id)
      t.timestamps
    end
  end
end
