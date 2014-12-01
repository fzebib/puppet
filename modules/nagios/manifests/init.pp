#class nagios {
   #package {
      #‘nagios3′:
      #   ensure  => installed,
     #    alias   => ‘nagios’,
    #     ;
   #}

  # service {
   #   ‘nagios3′:
    #     ensure  => running,
     #    alias   => ‘nagios’,
      #   hasstatus       => true,
       #  hasrestart      => true,
        # require => Package[nagios],
   #}

class nrpe {
   package {
      "nrpe.x86_64"
         ensure => installed,
            alias => 'nrpe',
               ;
   }
   
   service {
      'nrpe.x86_64':
         ensure => running,
         alias => 'nrpe',
         hastatus    => true,
         hasrestart  => true,
         require => Package[nrpe],
         }
