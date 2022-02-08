module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then 'info'
      when 'success' then 'success'
      when 'error', 'alert' then 'danger'
    end
  end
end
