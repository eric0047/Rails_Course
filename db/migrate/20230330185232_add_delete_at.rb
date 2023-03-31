class AddDeleteAt < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :deleted_at, :datetime, default: nil
    # 軟刪除要加的欄位，要放在作用對象的資料庫
    add_index :resumes, :deleted_at
    # 加入索引值(像是原文書後半段厚厚的的原文註解)增加讀取速度，雖然寫入速度會比較慢，但網頁基本上都是讀取的量比寫入的量還多
  end
end
