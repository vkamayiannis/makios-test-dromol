class RouteReceiver < ActiveRecord::Base
  self.sequence_name = 'ROUTERECEIVERS_SEQ'
  belongs_to :route
  belongs_to :customer

  def customer_name
    customer.try(:name)
  end

  def customer_name=(name)
    self.customer = Customer.find_by_name(name) if name.present?
  end
end
