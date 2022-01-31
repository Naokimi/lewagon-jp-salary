module PagesHelper
  def true_false_display(input)
    case input
    when 0, false then '<i class="fas fa-times text-danger fs-5"></i>'.html_safe
    when 1        then '<span class="text-info fw-bold fs-5">△</span>'.html_safe
    when 2, true  then '<i class="far fa-circle text-success"></i>'.html_safe
    end
  end
end
