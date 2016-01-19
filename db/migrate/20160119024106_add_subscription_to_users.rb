class AddSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean
    add_column :users, :plan, :string
  end
end
