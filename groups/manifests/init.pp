# Creates user groups to be assigned in class 'users'
# group IDs also assigned

class groups
{
  group 
  {
    'sysadmin': 
    ensure = > present,
    gid = > '500',
  }
  group 
  {
    'cars': 
    ensure = > present,
    gid = > '500',
  }
  group 
  {
    'trucks': 
    ensure = > present,
    gid = > '500',
  }
  group 
  {
    'ambulances': 
    ensure = > present,
    gid = > '500',
  }
