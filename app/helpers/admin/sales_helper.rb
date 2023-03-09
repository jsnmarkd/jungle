module Admin::SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def active_name

  end

  def active_percent_off
  end
end
