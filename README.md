# pm_profiler

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
    * [What is managed](#what-is-managed)
      * [Files](#files)
      * [Packages](#packages)
      * [Services](#services)
      * [Other Resources](#other-resources)
    * [Dependencies](#dependencies)
3. [Usage - Configuration options and additional functionality](#usage)
    * [ENC configuration and overrides](#enc-setup)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes and parameters](#classes-and-parameters)
    * [Defined Types Provided](#defined-types-provided)
    * [Facts Provided](#facts-provided)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Extensibility](#extensibility)
8. [Authors](#authors)
9. [Change Log](https://github.com/exodusftw/puppet-pm-profiler/tree/master/CHANGELOG.md)

## Overview

Manages installation and configuration of SUSE power management profiles

To retrieve from Puppet Forge either:
* [Click Here](https://forge.puppetlabs.com/exodusftw/pm_profiler)
* Execute Command `puppet module install exodusftw-pm_profiler`

## Module Description

Manages the installation, configuration, and maintenance of the SUSE Enterprise Linux Power Management Profiles

**In order to get started with installation, ensure the Packages listed** [Here](#packages) **are available in your package manager of Choice:**

* `Preferred Package Managers`:
  * [Zypper](https://en.opensuse.org/Portal:Zypper)
  * [YUM](http://yum.baseurl.org/)
  * [YaST](https://en.opensuse.org/Portal:YaST)
  * [RUG](https://www.suse.com/documentation/sled10/sled_deployment_sp1/data/sec_onlineupdate_rug.html)

* `Preferred System Management Tools`:
  * [Spacewalk](http://spacewalk.redhat.com/)
  * [Red Hat Network Satellite](https://access.redhat.com/products/red-hat-satellite)
  * [SUSE Manager](https://www.suse.com/products/suse-manager/)

**Also - Please update the following variables for your environment as necessary in** [params.pp](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/params.pp)

* `pm_profiler_version`: Version of pm-profiler package to install - defaults to `present`

### What Is Managed

#### Files
* `/etc/pm-profiler.conf`

#### Packages
* `pm-profiler`

#### Services
* `pm-profiler`

#### Other Resources

* exec entries

### Dependencies
* `puppetlabs/stdlib`

## Usage
Example:
```puppet
class { 'pm-profiler':
  pm_profiler_version => 'latest',
}
```

### ENC Setup
Overrides are available for:
* `pm_profiler_version` - Defaults to `present`
  * To force installation of latest version - ensure latest RPM's are present in backend YUM/SMT Repo
  * Configure necessary Matcher values in ENC and set value to: `latest`

## Reference

### Classes and Parameters
* `pm_profiler`: The main module class [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/init.pp)
* `pm_profiler::params`: Default Params class [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/params.pp)
* `pm_profiler::install`: Manages installation of `pm-profiler` package [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/install.pp)
* `pm_profiler::config`: Manages configuration in `/etc/pm-profiler.conf` [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/config.pp)
* `pm_profiler::service`: Manages and Ensures Agent process are running [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/service.pp)

### Defined Types Provided
* `pm_profiler::pm_config`: Enables creation and application of custom power management profile [Code Detail](https://github.com/exodusftw/puppet-pm-profiler/tree/master/manifests/pm_config.pp)
* `available type attributes`:
  
  * `description`: Description of Power Management Profile
    * Data Type: `string`
  
  * `cpu_governor`: CPU frequency scaling governor
    * Valid values: `powersave`, `performance`, `ondemand`, `userspace`
    * Data Type: `string`
 
  * `read_ahead_kb`: Read ahead size in KB
    * Defaults to Empty String - ``
    * Data Type: `integer`
  
  * `power_savings`: CPU Power Savings
    * Defaults to `0`
    * Data Type: `integer`
  
  * `sata_alpm`: SATA Aggressive Link Power Management
    * Valid values: `min_power`, `max_performance`, `medium_power`
    * Data Type: `string`
  
  * `hal_disable_polling`: Disable polling on drives with removable media
    * Defaults to Empty String - ``
    * Data Type: `integer`
  
  * `dirty_writeback_centisecs`: Kernel buffers writes to files that applications perform for a period of time
    * Defaults to Empty String - ``
    * Data Type: `integer`
  
  * `external_hook`: External script or binary which gets executed at the end of profile activation
    * Data Type: `string`
  
  * `power_button_hook`: Command to execute when the power button is pressed and there is no active and running X session
    * Data Type: `string`
  
  * `ondemand_up_threshold`: Defines the time the CPU has to be busy in order to switch up frequencies
    * Defaults to Empty String - ``
    * Data Type: `string`

  * `ondemand_sampling_rate`: Modify kernel default sampling rate value
    * Defaults to Empty String - ``
    * Data Type: `integer`

  * `ondemand_powersave_bias`: Lowers the target CPU frequency by a specified percent
    * Defaults to Empty String - ``
    * Configured in units of 0.1%, so it has an effective range of `1` through `1000`, resulting in 0.1% to 100% impact
    * Data Type: `integer`

Example:
```puppet
pm_profiler::pm_config  { 'sap_hana':
  description  => 'Power management profile for sap_hana',
  cpu_governor => 'performance',
}
```

### Facts Provided
None

## Limitations

Tested on:
* SLES 10sp4
* SLES 11 (SP1, SP2, SP3)
* SLES 12

## Development
No special development requirements

## Authors

* Jeremy Grant <Jeremy.Grant@outlook.com>

