module ApplicationHelper
  def time_in_day(time)
    x = t('morning') if time.strftime('%P') == 'pm' || t('evening')

    "#{time.strftime('%I:%M')} #{x}"
  end
end
