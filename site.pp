node default {
  # Level 1: Digital Fingerprint
  file { 'C:/PuppetMission':
    ensure => directory,
  }

  file { 'C:/PuppetMission/hello.txt':
    ensure  => file,
    content => 'Puppet was here at Nayan Ghate',
    require => File['C:/PuppetMission'],
  }

  # Level 2: Service Lock
  service { 'Spooler':
    ensure => stopped,
    enable => false,
  }

  # Level 3: Secret Agent Registry
  registry_key { 'HKLM/Software/PuppetMaster':
    ensure => present,
  }

  registry_value { 'HKLM/Software/PuppetMaster/MissionStatus':
    ensure => present,
    type   => string,
    data   => 'Success',
    require => Registry_key['HKLM/Software/PuppetMaster'],
  }

  # Level 4: Silent Installer
  include chocolatey

  package { 'notepadplusplus':
    ensure   => installed,
    provider => chocolatey,
    require  => Class['chocolatey'],
  }

  # Level 5: Identity Report
  file { 'C:/PuppetMission/spec_report.txt':
    ensure  => file,
    content => "This machine is running ${facts['os']['name']} ${facts['os']['release']['full']} and has ${facts['memory']['system']['total']} of RAM.",
  }

  # Boss Level: Self-Healing Website
  iis_feature { 'Web-Server':
    ensure => present,
  }

  file { 'C:/inetpub/wwwroot/index.html':
    ensure  => file,
    content => '<h1>Welcome to Nayan Ghate&#39;s Puppet Self-Healing Website</h1><p>Managed by Puppet!</p>',
    require => Iis_feature['Web-Server'],
  }

  service { 'W3SVC':
    ensure  => running,
    enable  => true,
    require => Iis_feature['Web-Server'],
  }
}
