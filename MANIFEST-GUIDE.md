# Puppet Manifest Authoring Guide

This guide provides best practices and examples for writing Puppet manifests for Windows agents.

## Basic Structure

All manifests should use the `node default` block:

```puppet
node default {
  # Resources go here
}
```

## Common Resources

### File Resource

```puppet
file { 'C:\path\to\file.txt':
  ensure  => present,  # or absent
  content => 'File content here',
  # Optional attributes
  owner   => 'Administrator',
  group   => 'Administrators',
  mode    => '0644',
}
```

### Service Resource

```puppet
service { 'ServiceName':
  ensure => running,  # or stopped
  enable => true,     # or false
}
```

### Package Resource

```puppet
package { 'package_name':
  ensure   => installed,  # or absent
  provider => chocolatey, # or windows
}
```

### Registry Resource (requires puppetlabs-registry)

```puppet
registry_value { 'HKLM\Software\Key\ValueName':
  ensure => present,
  type   => string,  # or dword, etc.
  data   => 'ValueData',
}
```

### IIS Feature (requires puppetlabs-iis)

```puppet
iis_feature { 'Web-Server':
  ensure => present,
}
```

## Using Facts

Facts provide dynamic information about the agent:

```puppet
$content = "OS: ${facts['os']['name']} Version: ${facts['os']['release']['full']} RAM: ${facts['memory']['system']['total']}"

file { 'C:\report.txt':
  ensure  => present,
  content => $content,
}
```

## Dependencies

Use `require` to ensure resources are applied in order:

```puppet
file { 'C:\dir':
  ensure => directory,
}

file { 'C:\dir\file.txt':
  ensure  => present,
  content => 'content',
  require => File['C:\dir'],
}
```

## Best Practices

- Use absolute paths for Windows resources
- Test manifests with `puppet parser validate`
- Use facts for dynamic content
- Keep manifests idempotent
- Document complex logic with comments