# Stylight coding assessment - Budget notifications
Stylight at its core is a platform where fashion retailers can advertise their products. They specify a budget, i.e. an upper limit to the amount of money they are prepared to spend each month in exchange for an equivalent amount of exposure on our platform. Once that budget is exhausted, shops go _offline_ and their products are no longer advertised on Stylight until a new month begins and the advertising budget is replenished.

## Database
The system runs on MySQL Database and the Server version is 10.4.14-MariaDB - Source distribution

The project folder includes a file `migration.sql`. 

### Database Settings
By default the database settings are in `settings.py` file. These values
can be updated regarding the local machine database settings
DB_USER = 'root'
DB_PASSWORD = ''
DB_HOST = 'localhost'
DB_NAME = 'stylight_db'
DB_PORT = '3306'

### Database Schema Updates
Shops `t_shops` table remainging same as it is given but budgets `t_budgets` table is updated where `a_a_notify_status` field is added to it.

* `a_notify_status`: Specifies, whether a shop is notified when they already reach 50%. `1` means they are notified, `0` means they aren't.

## Setup Project
* Python 3
* MySQL Database
* Install requiremnts packages. `pip install -r requirements`

## Explanation

### database.py
* Database  - A class with one instance variable(`connection`) and 5 methods(`_create_db_connection`, `fetch_budgets`, 
    `update_notify_status`, `set_shop_offline`, `fetch_shop_with_budget_changes`) 
    * Variables - 
        * `connection` - keep database connection value
    * Methods -
        * `_create_db_connection` - Method to create MySQL DB Connection
        * `fetch_budgets` - Method to fetch all the budgets where
            monthly expenditure is greater than or equals to 50%
        * `update_notify_status` - Method to update notification statuses to 1 or 0
        * `set_shop_offline` - Method to set shops in offline or online
        * `fetch_shop_with_budget_changes` - Method to fetch all shops with budget changes
        for the current month. This helps to update the notify 
        status to 0 if it is offline or set shop to online again

### models.py
* Budget  - A class with 5 instance variables(`shop_id`, `budget_amount`,
        `amount_spent`, `month`, `notify_status`) and 2 methods(`budget_percentage`, `notify_shop`) 
    * Variables - 
        * `shop_id`: Signifies, which shop the budget is associated with.

        * `budget_amount`: Signifies the monetary value a shop is willing to spend with Stylight in a given month.

        * `amount_spent`: Represents how much money the shop has spent in that month.

        * `month`: Signifies the month a budget is valid for.
        * `notify_status`: Specifies, whether a shop is notified when they already reach 50%. `1` means they are notified, `0` means they aren't.

    * Methods -
        * `budget_percentage` - Return expenditure budget\'s Percentage
        * `notify_shop` - Method to notify shop

### main.py
* Methods -  
    * `check_shops_budgets`: -  Method to checks all shops' budgets and 
    expenditures for the current month and notify shop.
    * `check_and_update_shops_notify_status`: - Method to fetch all shops with budget changes for the current month. This helps to update the notify 
    status to 0 if it is offline or set shop to online again
    * Run main `python main.py`  
### Sample of outputs
* Notification when they reach 50% or plus of the current month's budget
```
*[1]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 1
 - Current Date: 2020-09-13
 - Current Month's Budget: 960.00
 - Current Month's Expenditure: 803.67
 - Current Month's Expenditure budget's Percentage: 83.72%

*[3]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 3
 - Current Date: 2020-09-13
 - Current Month's Budget: 890.00
 - Current Month's Expenditure: 580.81
 - Current Month's Expenditure budget's Percentage: 65.26%

*[5]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 5
 - Current Date: 2020-09-13
 - Current Month's Budget: 870.00
 - Current Month's Expenditure: 505.12
 - Current Month's Expenditure budget's Percentage: 58.06%

*[7]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 7
 - Current Date: 2020-09-13
 - Current Month's Budget: 990.00
 - Current Month's Expenditure: 805.15
 - Current Month's Expenditure budget's Percentage: 81.33%

*[8]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 8
 - Current Date: 2020-09-13
 - Current Month's Budget: 720.00
 - Current Month's Expenditure: 504.25
 - Current Month's Expenditure budget's Percentage: 70.03%
```

* Notification when they reach 100% of the current month's budget
```
*[1]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 1
 - Current Date: 2020-09-13
 - Current Month's Budget: 960.00
 - Current Month's Expenditure: 960.00
 - Current Month's Expenditure budget's Percentage: 100.00%

*[3]* Your monthly expenditure reaches certain thresholds
 - Shop ID: 3
 - Current Date: 2020-09-13
 - Current Month's Budget: 890.00
 - Current Month's Expenditure: 1020.00
 - Current Month's Expenditure budget's Percentage: 114.61%      
```


### tests.py
* Test cases:
    * All the tests case are well explained there
    * Run tests: `pytest tests.py`

## Additional thoughts answers
* Does your solution avoid sending duplicate notifications?:
    * Yes my solution avoid sending duplicate notifications
    * If `a_notify_status` is 1 the system does not send notification to the shops

* How does your solution handle a budget change after a notification has already been sent?
    * Yes my solution handles a budget change after a notification has already been sent
    * I implemented a function to run and to fetch all shops with budget changes for the current month. This helps to update the notify 
    status to 0 if it is offline or set shop to online again
    * The function or method name is `check_and_update_shops_notify_status`
