maintainer       "Arangamanikkannan Manicka"
maintainer_email "arangamani.kannan@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures etherpadlite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends		 "node"

recipe		 "etherpadlite::prepare_pad", "Installs and prepares etherpad lite"
recipe		 "etherpadlite::start_pad", "Start the pad"

