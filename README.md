# zendesk-tickets
## overview

This app allows you to view Tickets from the Zendesk API.

## Installation Instructions

This program was coded and tested in ruby 2.5.3.

Clone the repository into your local machinee

    $ git clone https://github.com/alexvassiliou/zendesk-tickets.git
    $ cd zendesk-tickets

In the root folder, please run the following commands in your terminal. This will ensure bundler and all the respective gems are installed.

    $ gem install bundler
    $ bundle install
    
    
## Running the app
To run the app

    $ ruby app.rb 

## Test Instructions
To run tests for the ticket viewer application, please run the following commands:

    $ bundle exec rspec
    
## Design Notes

1. Have exposed the .env file on this repo to make it easier to pass on the credentials for the purpose of this challenge.  Better practise would be to have the .env generate on execution of a script once repo has been cloned so that user can enter their own credentials into it.  And then include my .env on my .gitignore file to prevent my credentials from being accessed via the github repo.

2. Extending above, I could also create a user model that takes the zendesk authentication to pass onto the client.  I decided not to build this feature, but would be easily achievable.

3. Opted to use the zendesk api gem instead of building my own repository and model as the gem already has validations and specs built into it, ensuring its reliability.

4. API call caches the page you are on, so if you select list each subsequent time it is in memory so will load the page quicker.  However any new action will update the cache to ensure that tickets being displayed are always current and theoretically you can page through thousands of tickets or jump to specific pages.

5. Obvious limitation of the above is that app will be slower.  Can be mitigated slightly by calling more tickets per page which is an attribute of the TicketsController, wadjusted via the code atm but could easily include it as a user input.

6. Initially intended to decouple my Router class by using Command class to map to controller and view functions to user input.  However, due to time constraints I was unable to complete this, so the Command class currently just parsed the user input into a symbol for later refactoring.

7. Testing the controller didnt have the time to create mocks so unfortunately it calls the API a few times.  However because they are only returning a limited amount of results per page it shouldnt be too bad, just means that the API client connection has to work for the TicketsController tests to pass.

8. Following on from that I need to perform some integration tests on the router class to check that the no connection message is accurate as well as the routes in general.
