#node default { }

node 'dev-box' {

	# Eclipse EE for Webdevelopers, Luna.
	exec { 'wget eclipse':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/osgp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz',
		before => Exec['unpack eclipse'],
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack eclipse':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz -C /home/dev/Tools',
	}

	exec { 'install cucumber-eclipse plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository http://cucumber.github.io/cucumber-eclipse/update-site -installIUs cucumber.eclipse.feature.feature.group',
		require => Exec['unpack eclipse']
	}

}

