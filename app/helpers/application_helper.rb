module ApplicationHelper
##
# This Ruby function returns the time of day in a specific format based on the input time.
# 
# Args:
#   time: The input parameter `time` is a Time object representing a specific time of day.
  def time_in_day(time)
    x = t('morning') if time.strftime('%P') == 'pm' || t('evening')

    "#{time.strftime('%I:%M')} #{x}"
  end

##
# The function maps flash message levels to corresponding Bootstrap alert classes.
# 
# Args:
#   level: The level parameter is a string that represents the type of flash message being displayed.
# It can be one of the following values: 'success', 'error', 'notice', 'alert', or 'warn'.
  def flash_class(level)
    bootstrap_alert_class = {
      'success' => 'alert-success',
      'error' => 'alert-danger',
      'notice' => 'alert-info',
      'alert' => 'alert-danger',
      'warn' => 'alert-warning'
    }
    bootstrap_alert_class[level]
  end

##
# This is a Ruby function that maps actions in a controller to their corresponding translations.
# 
# Args:
#   action: The `action` parameter is a string that represents an action to be performed in a Rails
# controller. It could be one of the following: 'destroy', 'index', 'create', or 'update'.
  def action_ar_en_mapper(action)
    case action
    when 'destroy'
      t('destroy')
    when 'index'
      t('index')
    when 'create'
      t('create')
    when 'update'
      t('update')
    else
      'unknow'
    end
  end
end
