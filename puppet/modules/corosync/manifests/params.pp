class corosync::params {
  $conf_dir          = '/etc/corosync'
  $local_ip          = $::ipaddress_eth1
  $multicast_ip      = '226.94.1.1'
  $multicast_port    = '5405'
  $corosync_version  = 'latest'
  $pacemaker_version = 'latest'
}
