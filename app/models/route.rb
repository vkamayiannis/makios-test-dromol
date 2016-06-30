class Route < ActiveRecord::Base
  belongs_to :customer
  belongs_to :transportation
  validates_presence_of :customer

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
