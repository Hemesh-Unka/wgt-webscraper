# Webscraper Tech Test

#### The Task
The task was to write a piece of software that scrapes concert information from the [WeGotTickets UK website](http://www.wegotickets.com).

The information that needed to be scraped includes:
- the artists playing
- the city
- the name of the venue
- the date
- the price

This information was then needed to be outputted to a readable format of my choice (e.g. JSON, XML, CSV etc.).

**Note:** This tech test was limited to 2 hours

#### Getting Started
1. Download and unzip the application onto your machine
2. Redirect your console into the root of the directory `cd /songkick_tech_test`
3. Ensure you have [Bundler](https://bundler.io/) installed by typing `bundle -v`.
4. Install the dependencies of the program by typing `bundle install` into your console

### Usage
Example IRB usage shown below

```bash
2.5.0 :001 > require './lib/runner.rb'
  => true
2.5.0 :002 > runner = Runner.new
  => #<Runner:0x00007fa72599ba00 @scrape=Scrape, @parse=Parse, @file_writer=FileWriter>
2.5.0 :003 > runner.scrape('http://www.wegottickets.com/searchresults/adv')
  => 1657
```
After completing the above, in the home directory, there should be a new file called `results.json` with the parsed results in JSON format.

```bash
[{"title":"THE SWARMING PRESENTS: MINORS","location":"PORTSMOUTH: Edge of the Wedge","date":"Sun 20th May, 2018, 7:00am","price":"£6.60"},{"title":"BEN SOMERS' BRASS HYSTERIA","location":"LONDON: Upstairs @ Ronnie Scotts","date":"Sun 20th May, 2018, 7:30am","price":"£8.80"},{"title":"GELLERT SPA FULL DAY ENTRANCE TICKET","location":"BUDAPEST: Gellért Thermal Spa","date":"Sun 20th May, 2018, 9:00am","price":"£19.80"},{"title":"GELLERT SPA FULL DAY ENTRANCE TICKET","location":"Gellért Thermal Spa Budapest Kelenhegyi út 4 H-1118 Hungary","date":"24th May 2017 - 31st December 2018 Spa Opening Hours 9am - 8pm Monday to Sunday","price":""},{"title":"SZÉCHENYI SPA FULL DAY ENTRANCE TICKET","location":"BUDAPEST: Széchenyi Thermal Spa","date":"Sun 20th May, 2018, 9:00am","price":"£18.70"},{"title":"SZÉCHENYI SPA FULL DAY ENTRANCE TICKET","location":"Széchenyi Thermal Spa Budapest Állatkerti krt. 9-11 H-1146 Hungary","date":"24th May 2017 - 31st December 2018 Spa Opening Hours 9am - 10pm Monday to Sunday","price":""},{"title":"CHOIR IN A DAY WITH JAMES SILLS - SONGS OF THE SEA SPECIAL!","location":"WIRRAL: West Kirby Arts Centre","date":"Sun 20th May, 2018, 9:45am","price":"£25.00"},{"title":"AROUND THE WALLS IN 80 MINUTES","location":"SOUTHAMPTON: The Bargate","date":"Sun 20th May, 2018, 10:00am","price":"£5.50"},{"title":"HITHER GREEN HISTORY WALK WITH THE RUNNING PAST BLOG!","location":"LONDON: Hither Green Station- Staplehurst Road Entrance","date":"Sun 20th May, 2018, 10:30am","price":"£0.00"},{"title":"HALLE PIANO CONCERT","location":"NEW MILLS: Spring Bank Arts","date":"Sun 20th May, 2018, 11:00am","price":"£15.40"}]
```

### Tests
To run the tests, in the root directory type `rspec` to view all the tests.

### Process

To begin with, I started setting up the framework for the project. I decided to use Ruby as I felt more comfortable with the RSpec testing framework and also as I knew that I would be using a lot of mocks to achieve what I wanted to do for this tech test. Also, I had heard about a Ruby scraper library called Nogokiri which I wanted to learn more about.

I started off by trying to poke around the WeGotTickets website with Postman to see if I could get the results to return on one page, or check to see if the website was using an API to return the search results. Unfortunately, this was not the case, and I would have to make a solution that was able to parse multiple pages.

I also needed to come up with an achievable MVP:
> I want a command to take the URL of the WeGotTickets website and parse at least one page of events and return these results in a JSON file format

To star off, I began with a class called `Scrape` with its only responsibility being that it was to return a Nokogiri object of a given URL. To mock the action in RSpec, I downloaded the HTML files for the website locally so I could use them instead of making heaps of http requests.

At that point the data needed to be extracted. I created a `Parse` class which took the Nokogiri data and returned only the data I that I was interested in(i.e name, city, date, price). It was one of the more time-consuming parts of the project, as you had to play around with the CSS selectors to return the right code.

After that was completed I needed to port the results to a file. I had to create a `FileWriter` class to deal with this. This was one of the more interesting parts of the test as I had never mocked file system handling throughout my time at Makers Academy.

Finally, when these parts had been completed, I needed a way to bring all of these components together. Therefore a `Runner` class needed to be created to port through the URL address to the `Scraper` class which then set off a chain reaction to get the final result.

### Final Thoughts
This challenge was an interesting one as I approached it in a TDD fashion. This meant breaking the code up into smaller modular pieces. In the end, I had a great time learning whilst being able to delve deeper into the world of RSpec and mocking.

**I didn't manage to finish**: With the given timeframe and also the new challenges that popped up, I was unable to finish this challenge. I managed to reach my MVP, which I was pleased about and I felt the code was presented in a readable manner.

### Going Forward
I would like to finish this challenge off by adding the feature to scrape all of the event pages instead of one. This could be easily achieved with minimal modification of the code, and most of the additional code would be implemented in the `Runner` class.

I also would have liked to have handled the edge cases a bit better. Some functionality that warned the user if no data was collected due to entering the wrong website would of have been nice.
