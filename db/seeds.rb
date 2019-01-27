# Generate users

User.create(first_name: 'Admin' , last_name: 'Admin' , email: 'admin@admin.com' ,
date_of_birth: Date.new, address: 'Address', phone_number: "123456", user_type: "admin",
password: '123456', password_confirmation: '123456')

User.create(first_name: 'Abderrahmen' , last_name: 'Masmoudi' , email: 'amasmoudi@gmail.com' ,
date_of_birth: Date.new, address: 'Address', phone_number: "123456", user_type: "user",
password: '123456789', password_confirmation: '123456789')

User.create(first_name: 'Test' , last_name: 'Test' , email: 'test@gmail.com' ,
date_of_birth: Date.new, address: 'Address', phone_number: "123456", user_type: "user",
password: '123456789', password_confirmation: '123456789')

# Generate expenses for user 1
Expense.create(claimer_name: 'Abderrahmen Masmoudi', expense_date: Date.new,
description: "Travel To Tunis", amount: 50.0, approved: 'waiting', user_id: 2)

Expense.create(claimer_name: 'Abderrahmen Masmoudi', expense_date: Date.new,
description: "Travel To Gabes", amount: 50.0, approved: 'declined', user_id: 2)

Expense.create(claimer_name: 'Abderrahmen Masmoudi', expense_date: Date.new,
description: "Travel To Tunis", amount: 70.0, approved: 'approved', user_id: 2)

Expense.create(claimer_name: 'Abderrahmen Masmoudi', expense_date: Date.new,
description: "Travel To Hammamet", amount: 45.0, approved: 'approved', user_id: 2)
3
# Generate expenses for user 2
Expense.create(claimer_name: 'Test', expense_date: Date.new,
description: "Travel To Hammamet", amount: 45.0, approved: 'approved', user_id: 3)

Expense.create(claimer_name: 'Test', expense_date: Date.new,
description: "Travel To Hammamet", amount: 15.0, approved: 'declined', user_id: 3)

Expense.create(claimer_name: 'Test', expense_date: Date.new,
description: "Travel To Hammamet", amount: 22.0, approved: 'declined', user_id: 3)

Expense.create(claimer_name: 'Test', expense_date: Date.new,
description: "Travel To Hammamet", amount: 5.0, approved: 'declined', user_id: 3)
