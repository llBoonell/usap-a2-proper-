# Specifies, then installs necessary packages
# NOTE: required before users init.pp ... finish this first, and groups! 
# Packages sourced from yum where possible... rpm elsewhere at strife's suggestion... 


class packages
{
  # wget installed first for peace of mind
  package
  {
    'wget' :
    ensure = > 'installed',
    provider = > 'yum',
  }
  
  #yum dependencies are **HERE**
  exec 
  { 
    'getDeps' :
    onlyif  => '/usr/bin/yum-config-manager',
    command => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-optional',
  }
  
  ####################
  #Simple stuff first
  ####################
  
  package
  {
    'openssh-server' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'httpd' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'mysql' :
    ensure = > 'installed',
    provider => 'yum',
  }  
  
  package
  {
    'tigervnc-server' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  
  package
  {
    'tmux' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  
  package
  {
    'lynx' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'gcc' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'gdb' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  #Installing vim... I still prefer nano
  package
  {
    'vim' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'emacs' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  package
  {
    'csh' :
    ensure = > 'installed',
    provider => 'yum',
  }
  
  ####################
  #Harder stuff now
  ####################
  
  # Installation of "fuse-sshfs"  (3-step process... yum and rpm)
  package 
  { 
    'glib*' :
    ensure   => 'installed',
    provider => 'yum',
  }
  -> package 
  { 
    'fuse*' :
    ensure   => 'installed',
    provider => 'yum',
  }
  -> package 
  { 
    'fuse-sshfs' :
    ensure   => 'installed',
    source   => 'ftp://195.220.108.108/linux/dag/redhat/el7/en/x86_64/dag/RPMS/fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',
    provider => 'rpm',
  }
  
  # Installation of "dia2code"
  package 
  { 
    'libxml2.so.2' :
    ensure => installed,
  }
  -> package 
  { 
    'dia2code' :
    ensure   => 'installed',
    source   => 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm?r=http%3A%2F%2Fdia2code.sourceforge.net%2Fdownload.html&ts=1507292790&use_mirror=ncu',
    provider => 'rpm',
  }
  
  ####################
  #Finishing off
  ####################
  
  # Installation of "mysql-server"
  package 
  { 
    'mysql57-community-release' :
    ensure   => 'installed',
    source   => 'https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm',
    provider => 'rpm',
  }
  
  # Installation of "cgdb"
  package 
  { 
    'cgdb' :
    ensure   => 'installed',
    source   => 'ftp://mirror.switch.ch/pool/4/mirror/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
    provider => 'rpm',
  }
  
}
