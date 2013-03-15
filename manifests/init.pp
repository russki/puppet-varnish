# == Class: varnish
#
# A basic module to manage Varnish

class varnish(
    $version                    = 'present',
    $enable                     = true,
    $enable_monit               = true,
    $start                      = true,
    $vcl_file                   = '/etc/varnish/default.vcl',
    $num_open_files             = 131072,
    $locked_shared_mem          = 82000,
    $listen_address             = '', 
    $listen_port                = 6081, 
    $admin_listen_address       = '127.0.0.1',
    $admin_listen_port          = 6082, 
    $secret_file                = '/etc/varnish/secret', 
    $min_threads                = 1,
    $max_threads                = 1000,
    $thread_timeout             = 120,
    $storage_file               = '/var/lib/varnish/varnish_storage.bin',
    $storage_size               = '1G',
    $ttl                        = 120,
    $vcl_source                 = $vcl_source,
    $vcl_content                = template('varnish/default.vcl.erb')
) {
    class{'varnish::install': } ->
    class{'varnish::config': } ~>
    class{'varnish::service': } ->
    Class["varnish"]
}

