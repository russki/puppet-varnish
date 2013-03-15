class varnish::service {
    $ensure = $varnish::start ? {true => running, default => stopped}
 
    service{'varnish':
        ensure  => $ensure,
        enable  => $varnish::enable,
    }

    if ($varnish::enable_monit) {
        include monit::common
        monit::common::simple_service { 'varnish': require => Service['varnish'] }
    }
}
