class varnish::config {
 
    File{
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        notify  => Class['varnish::service'],
    }

    if($varnish::vcl_source != '') and ($varnish::vcl_content == '' ) {
        file { "$varnish::vcl_file":
            source => $varnish::config_source,
        }
    } 
    if($varnish::vcl_content != '') and ($varnish::vcl_source == '' ) {
        file { "$varnish::vcl_file":
            content => $varnish::vcl_content,
        }
    } 
 
    file{'/etc/sysconfig/varnish':
            content => template('varnish/varnish.sysconfig.erb');
    }
}
