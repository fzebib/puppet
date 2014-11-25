node default {
  #class { 'apache': }             # use apache module
  #apache::vhost { 'example.com':  # define vhost resource
   # port    => '80',
   # docroot => '/var/www/html'

file {'/tmp/example-ip':	#resource type file
	ensure => present,	#make sure it exists
	mode   => 0644,		#file permissions
	content => "Here is my Public IP Address ${ipaddress_eth0}.\n",  #note the ipaddress
}

	include lemp
}
