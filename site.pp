node default {

  # Level 1 - Create folder
  file { 'C:/PuppetMission':
    ensure => directory,
  }

  # Level 1 - Create hello file
  file { 'C:/PuppetMission/hello.txt':
    ensure  => file,
    content => "Puppet was here at Nayan Ghate",
    require => File['C:/PuppetMission'],
  }

  # Level 2 - Stop and disable Print Spooler
  service { 'Spooler':
    ensure => stopped,
    enable => false,
  }

}
