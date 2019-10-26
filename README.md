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