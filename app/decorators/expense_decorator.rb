class ExpenseDecorator < Draper::Decorator
  delegate_all

  def format_date
  	expense_date.strftime("%d-%m-%Y")
  end

  def display_approved

    if approved == "approved"
   		"<td class='btn btn-success' style='width: 100px;'> #{approved} </td>
   		".html_safe
    elsif approved == "declined"
    	"<td class='btn btn-danger' style='width: 100px;' > #{approved} </td>
      ".html_safe
    else
      "<td class='btn btn-warning' style='width: 100px;' > #{approved} </td>
      ".html_safe
    end

  end

  def approved?
    approved == "approved"
  end

  def nil_image
    image_file_name.nil?
  end

   

end
