# JSON Output 
Please find 3 json output here: `https://github.com/trung-ho/verisys-challenge/tree/master/public/json_files`
# Installation and how to run
## Installation
Clone or download code

Then install all dependencies (you can skip this step if only run code by command line)
```bash
bundle install
```

## How to run
There are 2 ways:

### By Web UI
First: Open terminal and start server by command
```bash
rails server
```
Then: open web application in your localhost. Eg: `localhost:3000`

Next: Select CSV file and click on submit. Server will return json file and errors if any.

### By Console
Before run, please put your csv at `app/lib/csv_files`

Open terminal and run

```bash
ruby app/lib/csv_to_json.rb
```

Then: input your csv file which you have placed at `app/lib/csv_files` before. Eg: `sample.csv`
```ruby
Begin
Please input file name (eg: sample.csv)
Please note: File must be at app/lib/csv_files):
sample.csv
```

App will convert your csv file to json file and store at `public/json_files`


# Overview of the process and the technologies:
Langue: `Ruby`     
Framwork: `Rails`       
Unit Test: `Rspec`    

# Any challenges you
I have some challenge at beginning. I spend an 30 minutes to think about how to write a clean and reusable code.  
I also didn't have enough time to eliminate the duplicate record.  
I have used `Docker` before but never config it so that I skip that step. 
I spent more than 3 hours to finish it.

# Questions or assumptions
I have no question.

# Next steps to finish the challenge
I will need to eliminate duplicate record and configure Docker.

# Feedback on the challenge itself
I don't have any feedback


# License
[MIT](https://choosealicense.com/licenses/mit/)