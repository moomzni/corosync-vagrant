class corosync inherits corosync::params {

  include corosync::package, corosync::config, corosync::service

  Class['corosync::package'] -> Class['corosync::config'] ~> Class['corosync::service']

  Class['corosync::service'] -> Corosync::Resource::Primitive <|  |>
  Class['corosync::service'] -> Corosync::Resource::Property  <|  |>
}
