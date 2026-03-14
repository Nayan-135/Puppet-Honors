node default {

  file { 'C:/PuppetMission':
    ensure => directory,
  }

  file { 'C:/PuppetMission/hello.txt':
    ensure  => file,
    content => "Puppet was here at Nayan Ghate",
    require => File['C:/PuppetMission'],
  }

}
