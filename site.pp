node default {

  # Level 1 - Folder
  file { 'C:/PuppetMission':
    ensure => directory,
  }

  # Level 1 - Hello file
  file { 'C:/PuppetMission/hello.txt':
    ensure  => file,
    content => "Puppet was here at Nayan Ghate",
    require => File['C:/PuppetMission'],
  }

  # Level 2 - Stop Print Spooler
  service { 'Spooler':
    ensure => stopped,
    enable => false,
  }

  # Level 3 - Registry Key
  registry_key { 'HKLM\Software\PuppetMaster':
    ensure => present,
  }

  # Level 3 - Registry Value
  registry_value { 'HKLM\Software\PuppetMaster\MissionStatus':
    ensure => present,
    type   => string,
    data   => 'Success',
  }

}
