class redch {
	file {
		["/var/redch/",
		 "/var/redch/shared/",
		 "/var/redch/shared/config/"]:
		ensure => directory,
		owner => vagrant,
		group => vagrant,
		mode => 775
	}
}
