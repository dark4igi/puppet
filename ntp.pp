# Install NTP packege
package { "ntp":
  ensure => present,
}

#config NTP

#file { "/etc/ntp.conf":
#  ensure => present,
#  content => "server 0.centos.pool.ntp.org iburst\n"
#}

#start ntp service
service { "ntpd":
  ensure => "running",
}
