class corosync::package {

  package{ 'corosync' :
    ensure => $corosync::params::corosync_version,
  }

  package{ 'pacemaker' :
    ensure => $corosync::params::pacemaker_version,
  }

}
