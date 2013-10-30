class corosync::service {

  service{ 'corosync' :
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
