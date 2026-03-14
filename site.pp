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

  # Level 5 - Identity Report
  file { 'C:/PuppetMission/spec_report.txt':
    ensure  => file,
    content => "This machine is running ${facts['os']['name']} and has ${facts['memory']['system']['total']} of RAM.",
  }

  # Boss Level - Install IIS
  exec { 'install_iis':
    command => 'powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools',
    unless  => 'powershell.exe Get-WindowsFeature Web-Server | findstr Installed',
  }

  # Boss Level - Website File
  file { 'C:/inetpub/wwwroot/index.html':
    ensure  => file,
    content => "<h1>Welcome to Nayan Ghate's Puppet Self-Healing Website</h1>",
    require => Exec['install_iis'],
  }

  # Boss Level - Ensure IIS Service Running
  service { 'W3SVC':
    ensure => running,
    enable => true,
    require => Exec['install_iis'],
  }

}
