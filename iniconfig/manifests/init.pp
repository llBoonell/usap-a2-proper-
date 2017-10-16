#iniconfig file, "does various other things not covered in other files" - Strife called it 'agent configuration'. 

class iniconfig 
{
  #Twenty-minute run interval is set with this: 
  augeas 
  { 
    'agent_runinterval' :
    context => '/etc/puppetlabs/puppet/puppet.conf/agent',
    changes => 'set runinterval 20m',
  }
  
  #Default system path is set to /usr/local/bin with this:
  file 
  {
    '/etc/profile.d/set-user-bin.sh' :
    owner   => 'root',
    mode    => '0644',
    content => 'PATH=$PATH:/usr/local/bin',
  }
  
  #User 'becca' requires sudo privileges; sudoers file is edited with this: 
  exec 
  { 
    'give_sudo_becca' :
    command => '/usr/sbin/usermod -aG wheel becca',
  }
  
  # Printing timestamp (does this need to be logged somewhere or is it just... *there*?)
  file 
  { 
    '/etc/profile.d/agent_login.sh' :
    ensure  => present,
    mode    => '0777',
    owner   => 'root',
    group   => 'root',
    content => 'timeStamp=`/bin/date +"%d-%m-%Y_%H.%M.%S"`; echo "Puppet agent initialised: $timeStamp"',
  }
}
