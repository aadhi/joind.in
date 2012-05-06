class joindin::web::phpmyadmin {

    # Install PHPMyAdmin on /phpmyadmin
    package { "phpMyAdmin" :
        ensure  => present,
        require => File["EpelRepo"],
    }

    # Setup our own phpmyadmin configuration file
    file { "/etc/httpd/conf.d/phpmyadmin.conf" :
        source  => "puppet:///modules/joindin/phpmyadmin.conf",
        owner   => "root",
        group   => "root",
        require => Package["phpMyAdmin"],
        notify  => Service["apache"],
    }

}