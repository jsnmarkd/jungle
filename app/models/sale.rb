class Sale < ApplicationRecord

  def finished?
    ends_on < Date.current
  end

  def pending?
    starts_on > Date.current
  end
  
  def active?
    !pending? && !finished?
  end

end
