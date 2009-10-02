# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gym_session',
  :secret      => 'aa6d051fe335f0e5304f13ec33478e40d8dde0ed4d59b358c066615160ebb969976b63ffcc820393b66c45520b5e2c2559ce302f17e496c5b2e79306028898f5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
