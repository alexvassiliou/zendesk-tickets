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

    $ rake run

## Test Instructions
To run tests for the ticket viewer application, please run the following commands:

    $ rake spec


## Design Notes


1. Opted to use the zendesk api gem as it already has validations and specs built into into its models, ensuring its reliability.

2. API call caches the page you are on, so if you select list each subsequent time it is in memory so will load the page quicker.  However, any new action will update the cache to ensure that tickets being displayed are always current and theoretically you can page through thousands of tickets or jump to specific pages.

3. Obvious limitation of the above is that app will be slower.  Can be mitigated slightly by calling more tickets per page which is an attribute of the TicketsController, is adjusted via app.rb when instantiating the controller however can be refactored to take a user input.

4. Have exposed the .env file on this repo to make it easier to pass on the credentials so there arent any hiccups during the review.  Better practise would be to have the .env generate on execution of a script via a rake setup shell command so that user can enter their own credentials into it.

5. Extending above, I could also create a user model that takes the zendesk authentication from user input or settings and then passes it to the api client to use for instantiating an api client.  However as this app is only being used with one account it was not nessessary.

6. Initially intended to decouple my Router class by using Command class to map user input to controller and view functions.  However, due to time constraints I was unable to complete this, so the Command class currently just parsed the user input into a symbol.

7. Ran out of time to write some unit or intergration tests for the router, would have leaned toward the latter given the tightly coupled nature of the router.

8. Testing the controller didnt have the time to create mocks so unfortunately it calls the API a few times.  However because they are only returning a limited amount of results per page it shouldnt be too bad, just means that the API client connection has to work for the TicketsController tests to pass.

9. The find/search for ticket function calls the API and hence can be enabled to use any of the search field parameters easily, I limited it to ID only to demonstrate the feature for this app.  But in future I could build in a search by user feature too by using the api to call all the relevant information similar to the tickets, so that we could search by name etc.

