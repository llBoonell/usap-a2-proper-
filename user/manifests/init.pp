#Creates users and sets their parameters

class user
{
  #requiring groups and packages init.pp files
  require packages
  require groups
  user
  {
    'becca':
    ensure => present;
    home       => '/home/becca',
    managehome => true,
    groups     => ['sysadmin', 'cars'],
    shell      => '/bin/bash',
    uid        => '10011661',
  }
  user
  {
    'fred':
    ensure => present;
    home       => '/home/fred',
    managehome => true,
    groups     => ['trucks', 'cars', 'wheel'],
    shell      => '/bin/csh',
    uid        => '10021661',
  }
  user
  {
    'wilma':
    ensure => present;
    home           => '/home/wilma',
    managehome     => true,
    groups         => ['trucks', 'cars', 'ambulances'],
    shell          => '/bin/bash',
    uid            => '10031661',
    #purging ssh keys... almost missed that
    purge_ssh_keys => true,
  }
  # "wilma's" SSH key
  -> ssh_authorized_key { 'wilmasKey' :
    ensure => present,
    user   => 'wilma',
    type   => 'ssh-rsa',
    key    => 'WilmasSecretKey',
  }
}
