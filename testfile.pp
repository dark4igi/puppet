file { "/tmp/testfile":
  ensure => "present",
  owner => "ec2-user",
  group => "ec2-user",
  mode => "644",
  content => file ('/etc/hosts')
}
