# ASP.Net-CSharp-JQuery_PracticeWebApp
A practice web application that mimics an Online Banking Site.

####Overview
This is a project I am working on to expand and better develop my ASP.net/C# skills. Most of the web pages are templates. I created a small
 database to store user information into 4 tables: Users, Accounts, Transactions, ContactMessages. This project is 
 definitely in its early stages! 

####Features
* User can log in.
* Account page displays user's information retrieved from the database.
* Feedback page allows users to leave comments! Comments are stored and read from a XML file. Name textbox uses a required field validator while the comment box uses JQuery to make sure the user doesn't submit a message.
* Contact page allows users to email any concerns, problems, or suggestions. Emails are stored in a ContactMessages table in the database. Textboxes have required field validators and the email textbox uses a regular expression validator!
* Registration page allows new users to register for an account. Registration form validates all textboxes, checks if a user name already exists, and inserts the new information into the database. 
* Forgot Password page allows existing users to change their password only if the user name and email combination exists in the database!
* Users can now edit their profile information (password, name, and email)
* Users can request and send money from their account to a target email. All fields are validated. **[MOST CURRENT]**
 
####WIP
 * Allow existing users to update their password in their account page.
 * Add content to the About page.
  - About: General description of the purpose of the website
* Format elements to make the site look "prettier" and more appealing to the eye!
  
####Screenshots
![alt tag](https://raw.githubusercontent.com/Jen135790/ASP.Net-CSharp-JQuery_PracticeWebApp/master/screenshots/PracticeWebApp_Home.PNG)
![alt tag](https://github.com/Jen135790/ASP.Net-CSharp-JQuery_PracticeWebApp/blob/master/screenshots/PracticeWebApp_Account.PNG?raw=true)
![alt tag](https://raw.githubusercontent.com/Jen135790/ASP.Net-CSharp-JQuery_PracticeWebApp/master/screenshots/PracticeWebApp_AccountDetails.PNG)
**Check out the rest in the screenshots folder!**
