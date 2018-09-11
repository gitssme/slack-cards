# slack-cards



# Intro

I have chosen the random playing card command that will after a user types /cards.  They will get a random card from the deck.  If you type /cards help a dialog explains its function.

# App structure overview

The technology chosen is Ruby on Rails, rack, sinatra and Heroku to host the server.  The structure of the program involves using Sinatra to manage the route for the post request to send the message containing the card using the Slack web api.  The app used message.chat and message preview editor to format the message.  Rack acts as intermediate layer where parameters from the incoming command can be accessed.  
Then a ruby class randomly selects cards based on suit and rank.  Then imgur was used to upload free deck of cards to be hosted.  The class uses a hash which would be the suit/rank combo mapped to imgur url that points to corresponding card image.
The message crafted using the helpful editor found on Slack allowed me to preview the content.  Then it took trial and error process to send the message using HttpClient.  

In the future update different method to chat that could lead to faster response time and higher reliability.  The scenario of many users needs to be addressed.  How the command should behave too many requests are being made.  Then implement the Slack suggested authentication method and experiment to use prebuilt Slack ruby client.  Future feature addition could display yesterday’s card or allow users to play blackjack against one another.

# Test strategy 
Jenkins — Continuous build process for githook to trigger builds, updates, test periodically, and failure notifications
Multiple environments like Qa, staging, prod to segregate active development, fully tested code, isolate bugs and reproduce problems that may crop up
Add versioning to Isolate problems from build to build
## Unit tests
Use rspec framework for dev testing 
Every component needs to be tested in isolation.  This includes classes and methods in isolation.  The components such as command handling and server response. 
Deal Cards class all method functionality 
/Cards command ensure command parameters parsed correctly 
Test chat.message composition this includes message and parameters were supplied
## Smoke Tests
In this project a simple test such as calling /cards would suffice 
## Functional tests
Slack client from end user perspective to ensure they get the best experience 
/card help should display helpful message
Ensure command /card works for one user on all operating systems
Observe pattern for drawing multiple cards ensure card repetition is infrequent
Use /cards commands in various channels including #general , newly created channel, and direct message communication with another user
All users should in given channel should be able to see the particular command output including image 
/card command embedded within long or short messages should still be displayed 
Ensure the command displays as intended format including title and card image 
## Negative testing
Take command server down and perform the command
Block command image repository imgur through Charles proxy execute the command
Attempt to bring down the server by making hundreds or thousands of simultaneous /card command from single user
Have multiple users perform /card simultaneously 
## Performance testing
This would be backend test that will focus on the servers ability to serve as many commands as possible and respond appropriate message.  A tool like Jmeter needs to be used to emulate commands coming into the server and reponse meassages to chat.Mesage api.  A precondtion to this test  would be product requirements which include average command usage for the region where this command be used. Then using this data a model could be created for average usage and peak usage.  Then a series of tests for various rates could be tested with devops monitoring server health and bandwidth.  The developers monitor crashes and memory usage to investigate potential issues.  

