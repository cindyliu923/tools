# Tools for macos

## Redmine tool

If you use [redmine](https://www.redmine.org) for issue tracking, you can use this tool to help you update your spent time automatically.

### Usage

1. Clone this repository.
2. `cd tools`
3. `cp .env.sample .env`
4. Update your `.env` file
5. Use `crontab -e` to set your crontab
  - for example `* 17 * * 1 - 5 source /Users/xxx/Documents/tools/redmine.sh`
6. Finish
