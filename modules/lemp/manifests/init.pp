#installing lemp on agent
class lemp {
exec { 'yum update':	#exec resource named yum update
	command => '/usr/bin/yum update -y' #command to run
	}

# install nginx package
package { 'nginx':		
	require => Exec['yum update'],   #require yum update before installing
	ensure => installed,
}
  
#install MySQL-server package
package { 'mysql':
	require => Exec['yum update'],
	ensure => installed,
}

package { 'mysql-server':
	require => Exec['yum update'],
	ensure => installed,
}
#install Php5-FPM package

package { 'php-fpm':
	require => Exec['yum update'],
	ensure => installed,
}


service { 'mysqld':
	ensure => running,
	}

service { 'php-fpm':
	ensure => running,
	}

service { 'nginx':
	ensure => running,
	}

#create root dir
file { ["/var/www/","/var/www/html"]:
	ensure => directory,
	require => Package['nginx'],
}


#create sites enabled directory
file { ["/etc/nginx/sites-enabled"]:
	ensure => directory,
	require => Package['nginx'],
}

#Nginx web server conf
file { ["/etc/nginx/sites-enabled/firasimus.conf"]:
	ensure => file,
	content => template('lemp/firasimuswebconf.erb'), #default web server
	require => Package['nginx'],
}

file { '/usr/share/nginx/html/info.php':
        ensure => file,
        content => template('lemp/php.erb'), #phpinfo code
        require => Package['nginx'],
}
}

