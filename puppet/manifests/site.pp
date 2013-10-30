node default {

  include corosync

  # corosync::plugin { 'pacemaker' : version => '0', }

  # corosync::resource::property{ 'no-quorum-policy'       : value => 'ignore', }
  # corosync::resource::property{ 'stonith-enabled'        : value => false, }
  # corosync::resource::property{ 'cluster-infrastructure' : value => 'openais', }

  # corosync::resource::primitive{ 'test-cluster' :
  #   agent       => 'ocf:heartbeat:IPaddr2',
  #   parameters  => "ip=192.168.200.20 cidr_netmask=32",
  #   operations  => 'monitor interval=10s',
  #   metadata    => 'resource-stickiness=100',
  # }
}