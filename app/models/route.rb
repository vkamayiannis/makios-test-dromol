class Route < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :customer

  def customer_name
    customer.try(:name)
  end

  def customer_name=(name)
    self.customer = Customer.find_by_name(name) if name.present?
  end
end
