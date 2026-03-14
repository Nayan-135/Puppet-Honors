node default {
  iis_feature { 'Web-Server':
    ensure => present,
  }

  service { 'W3SVC':
    ensure => running,
    enable => true,
  }

  file { 'C:\inetpub\wwwroot\index.html':
    ensure  => present,
    content => '<h1>Welcome to Nayan Ghate\'s Self-Healing Website</h1><p>This site is managed by Puppet.</p>',
  }
}
