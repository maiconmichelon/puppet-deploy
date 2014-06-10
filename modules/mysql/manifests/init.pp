class mysql {
  file {"/etc/mysql/my.cnf":
      owner => root,
      group => root,
      mode => 664,
     # source => "/tmp/apache.cnf"
     # source => "puppet:///modules/mysql/files/my.cnf";
     # source => "/etc/puppet/modules/mysql/files/my.cnf"
     # source => 'puppet:///modules/mysql/files/my.cnf'
      source => "puppet:///modules/apache2/massiveapp.conf"
  }
}
