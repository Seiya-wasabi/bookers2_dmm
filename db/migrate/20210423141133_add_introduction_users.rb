class AddIntroductionUsers < ActiveRecord::Migration[5.2]
  def change
    t.text :introduction
  end
end
