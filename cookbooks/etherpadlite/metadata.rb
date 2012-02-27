maintainer       "Arangamanikkannan Manickam"
maintainer_email "arangamani.kannan@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures etherpadlite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe		 "etherpadlite::prepare_pad", "Installs and prepares etherpad lite"
recipe		 "etherpadlite::prepare_db", "Prepares the mysql database for etherpadlite"
recipe		 "etherpadlite::start_pad", "Start the pad"
recipe		 "etherpadlite::stop_pad", "Stopd the pad"

depends "node"
depends "rs_utils"

attribute "etherpadlite/logfile",
  :display_name => "Log file for etherpad lite",
  :description => "This file is used for looging all communication messages related to etherpad lite",
  :default => "etherpadlite.log"

attribute "etherpadlite/ipaddress",
  :display_name => "IP address to bind",
  :description => "The IP address etherpad lite should be used to bind",
  :default => "0.0.0.0"

attribute "etherpadlite/port",
  :display_name => "Port Number",
  :description => "The port number etherpad lite should be used to bind",
  :default => "80"

attribute "etherpadlite/db_password",
  :display_name => "Database password",
  :description => "Password for the database user that etherpad lite is supposed to use",
  :required => "required"
