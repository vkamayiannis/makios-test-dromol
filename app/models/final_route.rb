class FinalRoute < ActiveRecord::Base
  has_many :routes
  belongs_to :transportation, primary_key: 'id', foreign_key: 'trsid'
  belongs_to :customer, primary_key: 'id', foreign_key: 'cusid'
  accepts_nested_attributes_for :routes

  def customer_name
    customer.try(:name)
  end

  def customer_name=(name)
    self.customer = Customer.find_by_name(name) if name.present?
  end

  def transportation_shortcut
    transportation.try(:shortcut)
  end

  def transportation_shortcut=(shortcut)
    self.transportation = Transportation.find_by_shortcut(shortcut) if shortcut.present?
  end
end
