## Installation
Clone or download code, then run
```bash
bundle install
```
to install all dependencies

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
App will convert your csv file to json file and store at `public/json_files`

## License
[MIT](https://choosealicense.com/licenses/mit/)