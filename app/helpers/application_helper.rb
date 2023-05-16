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
    when 'read'
      t('read')
    else
      'unknow'
    end
  end

  ##
  # The function maps resource names to their corresponding translations using a case statement in Ruby.
  #
  # Args:
  #   resource: The parameter "resource" is a string that represents a resource name. The method
  # "resource_ar_en_mapper" takes this parameter and maps it to a corresponding translation key using a
  # case statement. The translation key is then passed to the "t" method to retrieve the translated
  # string. If the resource name
  def resource_ar_en_mapper(resource)
    case resource
    when 'users'
      t('main.users')
    when 'daily_statements'
      t('main.daily_statements')
    when 'chambers'
      t('main.chambers')
    when 'permissions'
      t('main.permissions')
    else
      'unknow'
    end
  end
end
