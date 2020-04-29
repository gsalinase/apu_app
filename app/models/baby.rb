class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :destroy
  accepts_nested_attributes_for :breastfeedings, allow_destroy: true, reject_if: proc { |attributes| attributes['time'].blank? }

  # Todas las veces que ha tomado pecho en la vida. 
  def total_times
    breastfeedings.count
  end

  # Cuantas veces a tomado pecho hoy 
  def times_today
    breastfeedings.where('created_at >= ?', 1.day.ago.to_datetime).pluck(:date).count
  end  

  # Fecha de la última vez que tomó pecho 
  def last_date
    breastfeedings.pluck(:date).last.strftime('%d-%m-%Y')
  end

  # Cuánto tiempo ha tomado este día
  def total_time
    breastfeedings.where('created_at >= ?', 1.day.ago.to_datetime).pluck(:time).sum { |time| time }
  end

  # Cuanta cantidad ha tomado hoy 
  def total_quantity
    breastfeedings.where('created_at >= ?', 1.day.ago.to_datetime).pluck(:quantity).sum { |time| time }
  end
end