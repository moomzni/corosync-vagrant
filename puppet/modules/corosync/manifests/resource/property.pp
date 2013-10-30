define corosync::resource::property(
  $property_name = $title,
  $value         = undef,
) {

  if $value == undef  {
    fail('You must specify a value for a pacemaker property')
  }

  exec{ "create-pacemaker-property-${property_name}-with-value-${value}" :
    command => "crm configure property ${property_name}=${value}",
    unless  => "crm_attribute --type crm_config --query --name ${property_name} | grep -e 'name=${property_name} value=${value}'",
    path    => ['/usr/sbin', '/bin', ],
  }
}
