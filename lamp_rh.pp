# execute 'apt-get update'
exec { 'update':                    # exec resource named 'apt-update'
  command => '/usr/bin/yum update -y'  # command this resource will run
}

# install apache2 package
package { 'httpd':
  require => Exec['update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure apache2 service is running
service { 'httpd':
  ensure => running,
}

# install mysql-server package
package { 'mariadb-server':
  require => Exec['update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure mysql service is running
service { 'mariadb':
  ensure => running,
#  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
  require => Package['httpd'],        # require 'apache2' package before creating
}



file { '/tmp/helloworld':
  ensure => present,
  content => "Hello, world!\n 123\n",
  mode => '0644',
  owner => 'ec2-user',
  group => 'ec2-user'
}


#file { '/bin/chmod':
#  ensure => present,
#  mode => '771',
#}
