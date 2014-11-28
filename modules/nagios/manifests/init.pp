class nagios {
   package {
      ‘nagios3′:
         ensure  => installed,
         alias   => ‘nagios’,
         ;
   }

   service {
      ‘nagios3′:
         ensure  => running,
         alias   => ‘nagios’,
         hasstatus       => true,
         hasrestart      => true,
         require => Package[nagios],
   }


