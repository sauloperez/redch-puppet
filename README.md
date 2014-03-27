# Redch Puppet

This is the collection of Puppet modules used to setup new instances for the services of the Redch project.

## Usage

You can provision a new instance by defining it in the [nodes.pp](https://github.com/sauloperez/redch-puppet-vm/blob/master/manifests/nodes.pp) file and running the puppet agent in it.
To do so, log into the machine and issue the following command:

    $ sudo puppet apply --verbose --debug --modulepath modules manifests/site.pp


