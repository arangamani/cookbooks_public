Description
===========
This cookbook installs etherpad-lite from source. This cookbook downloads the source, compiles and installs it. There is also recipes available to start and stop the pad.

The daemonize program is used to run the pad. This program is used to run any process as a unix daemon. 
Requirements
============
* node.js
  * python >= 2.7.1
* rs_utils

Attributes
==========
etherpadlite/logfile -> File name to store the communication log messages. The default is etherpadlite.log

etherpadlite/ipaddress -> The IP address etherpad lite should be used to bind. The default is 0.0.0.0 (localhost)

etherpadlite/port -> The port number etherpad lite should be used to bind. The default is 80

Usage
=====
Install the dependencies and start using the recipies. The following recipies are available.

1. prepare_pad: This recipe prepares the pad by downloading the source, compiling it, and making it ready to be started.
2. start_pad: This recipe installs daemonize program and then starts the program using daemonize. The daemonize uses the a log file to catch the output. This daemonize also stores the pid of the started process in a pid file.
3. stop_pad: The process is killed with the help of pid file created in the last step.
