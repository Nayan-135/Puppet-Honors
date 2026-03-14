node default {
  service { 'Spooler':
    ensure => stopped,
    enable => false,
  }
}
