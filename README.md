Many to Many relationship with class names that don't match association names.

User 
has_many :rsvps
has_many :attending_events, through: :rsvps, source: :event
has_many :events, foreign_key: "creator_id"

t.string :email
t.string :password_digest 


Event 
has_many :rsvps
has_many :attendees, through: :rsvps, source: :user
belongs_to :creator, class_name: "User"

t.string :name 
t.string :location
t.datetime :start_time
t.datetime :end_time
t.integer :creator_id

Rsvp
belongs_to :user 
belongs_to :event

t.boolean :attending
t.integer :user_id 
t.integer :event_id

----------          ----------
|  User  |          |  Event |
----------          ----------
        \            /
          ----------
          |  Rsvp  |
          ----------

Features 


## Users can create an account and login
## Users can create events
  - users can update or delete their own events
## Users can rsvp to events
  - users can update their rsvps
  - users can view the events they've rsvp'd to 
  - users can't rsvp to the same event more than once
  - users can't rsvp to their own event ?

Whenever we're building a feature, we want to focus on what needs to change in the 4(5) layers of our app to support that feature:

1. Database 
2. Model 
3. View 
4. Controller
5. Configuration (config.ru, Gemfile, environment, etc.)

As an example for User authentication

1. Database
  we need a users table
  we need some unique identifiable info about user in users table (username or email)
  we need a password_digest column on the users table. 
2. Model 
  we need a User model
  we need to invoke has_secure_password in the User model
  validate uniqueness of username (or email)
3. View 
  we need a signup form (username/email, password, password_confirmation)
  we need a login form (username/email, password)
  we need a logout button (form)
  we need links in the navbar related to authentication
    if we're logged in then show the logout button in the navbar
    if we're not logged in then show links to signup and login pages
4. Controller
  set :sessions to true (enable :sessions)
  set :session_secret equal to environment variable
  5 routes 
    - get '/signin' #signin form,
    - post 'signin' #signin form submission (find & authenticate user, store their id in session)
    - get '/signup' #signup form
    - post '/signup' #signup form submission (create user and store their id in session)
    - delete 'logout' #logout form submission (remove user's id from session)
5. Configuration
  bcrypt in gemfile
  dotenv in gemfile
  .env file that contains the session secret for our app

My tutorial on Sinatra Heroku deployment includes fully featured authentication including this session secret setup.
https://github.com/DakotaLMartinez/sinatra-heroku-demo

if you 
```
gem install session_secret_generator 
```
then you can run 
```
generate_secret
```
and that will make a long hexidecimal string that you can use as a session secret in the .env file (which you add to .gitignore)

```
#.env
SESSION_SECRET=96a11f4509fc4f71f23449d795386de5ae719f8e80d779aea30df025460fc4a1e145c76ec5375deaf0c260cabebab97ef3be5ee04e41205523300f2f0ceeea12
```

and then in the application controller you add:
```
set :session_secret, ENV.fetch('SESSION_SECRET') 
```