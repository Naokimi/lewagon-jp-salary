# Le Wagon Japan Alumni Salaries
A list of salaries Le Wagon Japan Alumni have gotten after graduating from the bootcamp.

### Prerequisites

- Ruby 2.7.2
- gem rails 6.1.4.4
- gem bundler 2.2.16

I recommend following [LeWagon's setup](https://github.com/lewagon/setup) to get your environment ready, but you'll probably have to install the required ruby version with rbenv

### Set up

Fork the project and clone it to you development environment (ideally using `gh repo clone`) then run the following commands:

- `cd lewagon-jp-salary`
- `bundle install`
- `yarn install`
- `rails db:create db:migrate db:seed`

### Running

Start in the project folder

- `rails s`

### Development process

Start in the project folder

- make sure you are on master branch and the working directory is clean (`git st` returns empty)
    - If it lists red files with a letter run `git stash`. If it lists red files with question marks remove the files `rm path/to/file`
- `git pull origin master`
- check the changes in files (Changed file -> run command):
    - Bundler -> `bundle install`
    - package-lock.json -> `yarn install`
    - db/schema.rb (and new files in db/migrate/) -> `rails db:migrate`
    - db/seeds.rb -> `rails db:seed`
- checkout to new branch `git checkout branch_name`
- work on the code
- implement tests covering your code
- add changes `git add path/to/file`
- commit changes `git commit -m "message describing the change"`
- check each item on the PRE-PUSH CHECKLIST below
- push to your fork `git push origin branch_name` or `git push origin HEAD`
- go to GitHub, submit a pull request to this repo, and add a short description of what the PR is trying to solve (by default follow the Issue-Solution model)
- tag [Naokimi](https://github.com/Naokimi) for the PR review

**You are responsible for pushing working code**! The PR review serves only for feedback on styling or to suggest other solutions. 

### Special thanks
Rails app generated with [Naokimi/lewagon-rails-templates-plus](https://github.com/Naokimi/lewagon-rails-templates-plus).
