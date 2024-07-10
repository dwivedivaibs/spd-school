class AddAdminUser < ActiveRecord::Migration[5.2]
  def change
    AdminUser.create!(email: 'admin@spd.com', password: 'Spdfzd@2024', password_confirmation: 'Spdfzd@2024')
  end
end
