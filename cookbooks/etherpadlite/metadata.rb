maintainer       "Arangamanikkannan Manicka"
maintainer_email "arangamani.kannan@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures etherpadlite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe		 "etherpadlite::prepare_pad", "Installs and prepares etherpad lite"
recipe		 "etherpadlite::start_pad", "Start the pad"
recipe		 "etherpadlite::stop_pad", "Stopd the pad"

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

attribute "etherpadlite/dbfile",
  :display_name => "File name for dirty database file",
  :description => "Dirty database file is used for storing all the database where a mysql database is not present",
  :default => "/var/etherpad-lite/dbfile.db"

