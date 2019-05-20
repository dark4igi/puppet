# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/yum update -y'  # command this resource will run
}

# install apache2 package
package { 'httpd':
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure apache2 service is running
service { 'httpd':
  ensure => running,
}

# install mysql-server package
#package { 'mysql-server':
#  require => Exec['yum'],        # require 'apt-update' before installing
#  ensure => installed,
#}

# ensure mysql service is running
#service { 'mysql':
#  ensure => running,
#}

# install php5 package
package { 'php':
  #require => Exec['yum'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
  require => Package['httpd'],        # require 'apache2' package before creating
}



file { '/tmp/helloworld':
  ensure => present,
  content => "Hello, world!\n",
  mode => '0644',
  owner => 'ec2-user',
  group => 'ec2-user'
}


#file { '/bin/chmod':
#  ensure => present,
#  mode => '771',
#}