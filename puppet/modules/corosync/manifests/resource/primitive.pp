define corosync::resource::primitive(
  $primitive_name = $title,
  $agent          = '',
  $operations     = '',
  $parameters     = '',
  $metadata       = '',
) {

  if $agent == '' {
    fail('No agent given for specified for corosync primitive')
  }

  if $operations == ''  {
    fail('No operations specified for corosync primitive')
  } else {
    $ops_string = "op ${operations}"
  }

  if $parameters == ''  {
    fail('No parameters specified for corosync primitive')
  } else {
    $params_string = "params ${parameters}"
  }

  if $metadata != ''  {
    $meta_string = "meta ${metadata}"
  }

  # Very basic check to see if a primitive of the same name already exists; will not check properties.
  exec{ "create-pacemaker-primitive-${primitive_name}" :
    command => "crm configure primitive ${primitive_name} ${agent} ${params_string} ${ops_string} ${meta_string}",
    unless  => "crm configure show ${primitive_name} |  grep -e 'primitive ${primitive_name} ${agent}'",
    path    => ['/usr/sbin', '/bin', ],
  }
}
