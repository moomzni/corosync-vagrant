class corosync::package {

  package{ [ 'corosync', 'pacemaker' ] :
    ensure => latest,
  }

}
