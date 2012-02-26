maintainer       "Arangamanikkannan Manickam"
maintainer_email "arangamani.kannan@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures etherpadlite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends		 "node"
depends		 "rs_utils"

recipe		 "etherpadlite::prepare_pad", "Installs and prepares etherpad lite"
recipe		 "etherpadlite::start_pad", "Start the pad"

attribute "etherpad-lite/logfile",
  :display_name => "Log file for etherpad lite",
  :description => "This file is used for looging all communication messages related to etherpad lite",
  :default => "/var/log/etherpadlite.log"

