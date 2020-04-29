class Breastfeeding < ApplicationRecord
  belongs_to :baby

  def name
    baby.name
  end
end
