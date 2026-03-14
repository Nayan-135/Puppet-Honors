node default {
  file { 'C:\PuppetMission\spec_report.txt':
    ensure  => present,
    content => "This machine is running ${facts['os']['name']} ${facts['os']['release']['full']} and has ${facts['memory']['system']['total']} of RAM.",
  }
}
