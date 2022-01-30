module PagesHelper
  def true_false_display(input)
    case input
    when 0, false then 'X'
    when 1        then '△'
    when 2, true  then 'O'
    end
  end
end
