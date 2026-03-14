node default {
  package { 'notepadplusplus':
    ensure   => installed,
    provider => chocolatey,
  }
}
