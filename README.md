corosync-vagrant
=================

Very basic two-node ubuntu cluster used for demonstrating how to configure a floating IP address using corosync and pacemaker.

cluster config
=================
* node1 - 192.168.200.10
* node2 - 192.168.200.11
* floating ip - 192.168.200.20

usage
=================
Simply 'vagrant up' from the root directory - Et voilà!

Uncommant the lines in puppet/manifests/site.pp to alter how corosync is configured
