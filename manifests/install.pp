class varnish::install {
    case $::osfamily {
        RedHat: {
            package{'varnish':
                ensure => $varnish::version
            }
        }
        default: {
            err( "${module_name} has not yet been implemented on ${::operatingsystem}" )
        }
    }
}
