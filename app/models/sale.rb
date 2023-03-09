class Sale < ApplicationRecord

  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

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
