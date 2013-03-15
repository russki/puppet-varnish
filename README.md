puppet-varnish
==============

This is a basic Varnish module that lets you configure Varnish on RedHat type boxes

To use it in your module, include it like this

include varnish

or

class { 'varnish': }

Here's a more complicated example.
This uses your VCL template, configures listen port, the number of threads to have at the very least and the storage size
For all the options that Varnish module supports at this time, visit your local init.pp

    class { 'varnish':
        vcl_content     => template('cache_host/mirrors.vcl'),
        listen_port     => 80,
        min_threads     => 50,
        storage_size    => '40G',
    }
