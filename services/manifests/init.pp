#Initialisation

class services 
{
  file 
  {
    '/var/www/s3541661':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
  }
  
  # Replace existing Apache httpd.conf with customised version
  -> file 
  { 
    '/etc/httpd/conf/httpd.conf' :
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/code/environments/production/manifests/configfiles/httpd.conf',
    require => Package['httpd'],
  }
  
  # Subscription to service
  -> service 
  { 
    'httpd' :
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
}
