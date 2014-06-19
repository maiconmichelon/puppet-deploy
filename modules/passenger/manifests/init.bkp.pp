class passenger {
  exec {
    "/usr/local/bin/gem install passenger":
    user => root,
    group => root,
    alias => "install_passenger",
    before => [File["passenger_conf"],Exec["passenger_apache_module"]],
    unless => "ls /usr/local/lib/ruby/gems/2.1.0/gems/passenger-4.0.44/"
  }
  exec {
    "passenger-install-apache2-module":
    user => root,
    group => root,
    alias => "passenger_apache_module",
    before => File["passenger_conf"],
    unless => "ls /usr/local/lib/ruby/gems/2.1.0/gems/passenger-3.0.11/ext/apache2/mod_passenger.so"
  }
  file {
    "/etc/apache2/conf.d/passenger.conf":
    mode => 644,
    owner => root,
    group => root,
    alias => "passenger_conf",
    notify => Service["apache2"],
    source => "puppet:///modules/passenger/passenger.conf"
  }
}
