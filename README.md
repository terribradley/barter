# Barter Bay
A site for barter commerce, for the week 5 group project (Ruby and CSS) at Epicodus, July 29, 2016

By Terri Bradley, Kyle Helyar, Brett New and Julia Dickey

## Description

This site:
* Allows users to:
    - create a new account
    - add profile details
    - edit profile details
    - view possible trades by theme
    - make an offer to another user
    - accept an offer, and see it on their dash
    - refuse a trade
    - rate another user
    - log in to their accounts with unique passwords

* Allows admin to:
    - Delete accounts
    - Add and delete tags

## Setup/Installation Requirements

* The site can be found [here](https://github.com/terribradley/barter) on GitHub
* Clone the github repository to view source files.
* Open Terminal Window, navigate into the barter folder:
  - Open another window, and type "gem install bundler"
  - Then type "bundle"
    - Once all gems are installed, type "postgres" and leave that window Open (when you are finished with this session, hit Ctrl + C before closing window in order to quit postgres)
      - In a new window, type "rake db:create"
      - After receiving confirmation that the database "barter" has been created, type "psql barter < barter.sql" (you only need to do this the first time you use the site on a new machine)
      - Then type ruby app.rb (leave this window open and do not type anything else in this window until you are ready to end your session; when ready to end session, hit Ctrl + C)
      - Open up a browser window, and enter "localhost:4567"
* Enjoy!

## Known Bugs

There are no known bugs. Please contact Julia if any arise.

## Support and contact details

For additional questions or comments, email [Julia](mailto:info@gmail.com).

## Technologies Used

Ruby, Sinatra, SQL, HTML, CSS, Bootstrap, ActiveRecord, Sass

Copyright (c) 2016 Julia Dickey, Terri Bradley, Kyle Helyar, Brett New
