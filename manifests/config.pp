# == Class: pm_profiler::config
class pm_profiler::config (
) inherits pm_profiler {

  #Management of default pm-profiler config file
  file { '/etc/pm-profiler.conf':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['pm-profiler'],
    notify  => Service['pm-profiler'],
  }
}
