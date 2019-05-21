
## update
exec { 'update':                    # exec resource named 'apt-update'
  command => '/usr/bin/yum update -y'  # command this resource will run
}
