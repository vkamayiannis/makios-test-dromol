class Route < ActiveRecord::Base
  belongs_to :customer
  belongs_to :transportation
  validates_presence_of :customer
  scope :filters_from_calendar, lambda { |params| filter_by_date(params) }
  self.per_page = 20

  scope :filters_from_form, lambda { |params| make_syntax(params) }

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

  def self.make_syntax(params)
    if params.nil?
      return where('1=1')
    end

    ret = []
    ret << '1=1 '

    unless params[:customer_id].blank?
      ret[0] += 'AND customer_id like ? '
      ret << params[:customer_id]
    end

    unless params[:route_date].blank?
      @date = DateTime.parse(params[:route_date])
      @time = @date.strftime('%Y-%m-%d')
      ret[0] += 'AND route_date = ? '
      ret << @time
    end

    unless params[:route_desc].blank?
      ret[0] += 'AND route_desc LIKE ? '
      ret << params[:route_desc].tr('*', '%')
    end

    unless params[:transportation_id].blank?
      ret[0] += 'AND transportation_id = ? '
      ret << params[:transportation_id]
    end
    where(ret)
  end

  def filter_by_date(params)
    if params.nil?
      return "1=1"
    else
      return "route_date = ?", params[:route_date]
    end
  end

end
