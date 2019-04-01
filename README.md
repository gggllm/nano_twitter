# Nano Twitter V 0.6

## Deployment in AWS:

[Nanotwitter](http://18.219.120.204:3000/)

##repo
* server: https://github.com/Nano-Twitter/nano_twitter
* client: https://github.com/Nano-Twitter/nano_twitter_client

## Tech Stacks
* Front-end: [React](https://reactjs.org/)
* Back-end: [Sinatra](http://sinatrarb.com/)

## Documentations
* [API](https://github.com/Nano-Twitter/nano_twitter/blob/master/doc/api.md)

## Contributors
* [Ye Hong](mailto:yehong@brandeis.edu)
* [Limian Guo](mailto:limianguo@brandeis.edu)
* [Chenfeng Fan](mailto:fanc@brandeis.edu)

## Test
Under the root directory, enter `rake test` to run the tests: `api_test.rb`, `model_test.rb` and `service_test.rb`.

## Version Changelogs

### Version 0.1
* Created github repo  LG
* Finished schema design YH
* Completed writing all data models  CF
* design basic 
* setting up readme.md CF

### Version 0.2
* Created skeleton Sinatra and React apps  LG
* Finished writing routes concerning authentication YH
* Tests passed on the User model and the routes written. CF
* Completed the login, register and home pages YH
* Heroku deployment failed YH

### Version 0.3
* Successfully deployed on Heroku: [NanoTwitter](https://nano-twitter-2019.herokuapp.com/) YH
* Restructured the front-end React app LG
* Added MobX for state management YH
* Added routing and authentication logic involving interactions between front-end and backend
* Finished NanoTwitter API Version 1 design CF
* Set up Code Pipeline auto testing and deployment on AWS(currently removed due to financial reason 2019.3.28)
YH

### Version 0.4 
* Connect our AWS project to mongoDB. LG
* Finish writing core backend services and apis:  CF
  - User
  - Follow
  - Tweet(without comment/like)
* Writing API test CF
* Writing Model test YH
* Writing service test CF
* Service module encapsulation CF
* Test interface route CF
* Process seed data LG
* Finish writing a simplified version of front-end homepage CF
* Implement the complete test interface: LG
  - POST test/reset/all
  - POST /test/reset?users=u
  - POST /test/user/{u}/tweets?count=n
  - GET /test/status
* Try Loader.io to add artificial load LG

### version 0.5
* adding tweeting function in front-end CF
* adding homepage CF
* adding redis, but not yet used LG
* change server from Thin to Falcon LG
* building index in mongoid LG
* optimizing mongoid schema CF
* optimizing test interface efficiency LG

### version 0.6
* deploying server on AWS LG
* simple load test using Loader.IO CF
* AmazonMQ server registered, gem installed YH
* adding rake db:create_indexes to the rake task LG
* adding full text index to tweet schema LG


## References
* [Nano Twitter Project Outline](http://cosi105b.s3-website-us-west-2.amazonaws.com/content/topics/nt/nt_outline.md/) 
* [React Tutorial](https://reactjs.org/tutorial/tutorial.html)
* [Mongoid Manual](https://docs.mongodb.com/mongoid/current/)
