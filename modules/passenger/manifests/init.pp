class passenger {
  exec {
    "/usr/bin/gem install passenger -v 3.0.11":
    user => root,
    group => root,
    alias => "install_passenger",
    before => [File["passenger_conf"],Exec["passenger_apache_module"]],
    unless => "ls /usr/local/lib/ruby/gems/2.1.0/gems/passenger-3.0.11/"
  }
  exec {
    "passenger-install-apache2-module --auto":
    user => root,
    group => root,
    before => File["passenger_conf"],
    alias => "passenger_apache_module",
    unless => "ls /usr/local/lib/ruby/gems/2.1.0/gems/passenger-3.0.11/ext/apache2/mod_passenger.c"
  }
  file {
    "/etc/apache2/conf-enabled/passenger.conf":
    mode => 644,
    owner => root,
    group => root,
    alias => "passenger_conf",
    notify => Service["apache2"],
    source => "puppet:///modules/passenger/passenger.conf"
  }
}

