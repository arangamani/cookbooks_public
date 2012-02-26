maintainer       "Arangamanikkannan Manicka"
maintainer_email "arangamani.kannan@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures etherpadlite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe		 "etherpadlite::prepare_pad", "Installs and prepares etherpad lite"
recipe		 "etherpadlite::start_pad", "Start the pad"

depends "node"
depends "rs_utils"

attribute "etherpadlite/logfile",
  :display_name => "Log file for etherpad lite",
  :description => "This file is used for looging all communication messages related to etherpad lite",
  :default => "/var/log/etherpadlite.log"

attribute "etherpadlite/ipaddress",
  :display_name => "IP address to bind",
  :description => "The IP address etherpad lite should be used to bind",
  :default => "0.0.0.0"

attribute "etherpadlite/port",
  :display_name => "Port Number",
  :description => "The port number etherpad lite should be used to bind",
  :default => "80"

attribute "etherpadlite/dirtyfile",
  :display_name => "File name for dirty database file",
  :description => "Dirty database file is used for storing all the database where a mysql database is not present",
  :default => "/var/dirty.db"

attribute "etherpadlite/dbtype",
  :display_name => "Database Type",
  :description => "The type of database should be used. Choose dirty for development and testing purposes. Choose mysql for anything other than development or testing",
  :default => "dirty"

attribute "etherpadlite/dbuser",
  :display_name => "Database user",
  :description => "User should be used to access the database"

attribute "etherpadlite/dbpassword",
  :display_name => "Database password",
  :description => "The password should be used to connecting to the database"

attribute "etherpadlite/dbhost",
  :display_name => "Database host",
  :description => "Hostname of the database"

attribute "etherpadlite/database",
  :display_name => "Database name",
  :description => "Database name to be used with etherpad lite"
