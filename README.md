# zendesk-tickets

Design Notes

1. Opted to use the zendesk api gem instead of building my own repository and model as the gem already has validations and specs built into it.
2. API call caches the page you are on, so if you select list each subsequent time it is in memory so will load the page quicker.  However any new action will update the cache to ensure that tickets being displayed are always current.
3. Initially intended to decouple my 'router' class by using Command class to map to controller and view functions to user input.  However, due to time constraints I was unable to complete this, so the Command class currently just parsed the user input into a symbol.
