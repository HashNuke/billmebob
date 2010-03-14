# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_billmebob_session',
  :secret => 'b2d8878c5703b97534170a74aab361827be257fdc2e37cfa9d2edf799cbeb8a759863a0911f23fb4aeeeb14213183498d05263de09723b08a4bac1ec8cf4851b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
