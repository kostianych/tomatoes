# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tomatoes_session',
  :secret      => '3f67781f21d5fd7e874f83081a94b53a30283d1c4f1d670f0ccb21179d2fc7ce8d83e947cddbbe920d200f2500d2ed7d85322c9041c9bd727ff463066b29b4c4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
