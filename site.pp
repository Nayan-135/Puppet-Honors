node default {

  # Level 1 - Folder
  file { 'C:/PuppetMission':
    ensure => directory,
  }

  # Level 1 - Hello File
  file { 'C:/PuppetMission/hello.txt':
    ensure  => file,
    content => "Puppet was here at Nayan Ghate",
    require => File['C:/PuppetMission'],
  }

  # Level 2 - Disable Print Spooler
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

  # Level 4 - Install Chocolatey
  include chocolatey

  # Level 4 - Install Notepad++
  package { 'notepadplusplus':
    ensure   => installed,
    provider => chocolatey,
    require  => Class['chocolatey'],
  }

}
