define corosync::plugin(
  $plugin_name = $title,
  $version     = undef,
  $conf_dir    = '/etc/corosync',
  ) {

  file { "${conf_dir}/service.d/${plugin_name}" :
    ensure  => file,
    content => template('corosync/etc/corosync/service.d/service.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['corosync'],
    notify  => Service['corosync'],
  }
}
