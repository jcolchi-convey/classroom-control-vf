class memcached{

file { '/etc/sysconfig/memcached.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/memcached/memcached',
  require => Package['memcached'],
 }
 package { 'memcached':
  ensure => present,
 }
 
service { 'memcached':
 ensure => running,
 enable => true,
 subscribe => File['/etc/sysconfig/memcached'],
}
}
