node default {
  registry_value { 'HKLM\Software\PuppetMaster\MissionStatus':
    ensure => present,
    type   => string,
    data   => 'Success',
  }
}
