# ForemanSubnetsWithBgpConfig

Add fields for BGP relevant configuration settings to the Foreman Subnet model.

## Installation

See [How_to_Install_a_Plugin](https://www.theforeman.org/plugins/#2.Installation)
for how to install Foreman plugins in general. The following should be sufficient.

1. Ensure Foreman will load the plugin by adding it to its bundler Gems collection
    ```bash
    echo 'gem "foreman_subnets_with_bgp_config"' >~foreman/bundler.d/foreman_subnets_with_bgp_config.rb
    chown foreman: ~foreman/bundler.d/foreman_subnets_with_bgp_config.rb
    ```
1. Produce the plugin Gem from a recent clone of the source Git repository
    ```bash
    git clone git@githut.com:foreman-plugins/foreman_subnets_with_bgp_config.git
    cd foreman_subnets_with_bgp_config
    gem build foreman_subnets_with_bgp_config.gemspec
    ```
1. Ensure no old versions of the plugin are installed
    ```bash
    gem uninstall foreman_subnets_with_bgp_config --version '>= 0'
    ```
1. Install the newly generated Gem **without dependencies**, in order to not replace any Gems used by Foreman
    ```bash
    gem install --ignore-dependencies foreman_subnets_with_bgp_config-*.gem
    /bin/rm foreman_subnets_with_bgp_config-*.gem # Cleanup to avoid future conflicts
    ```
1. Apply any pending database migrations
   ```bash
   foreman-rake db:migrate
   ```
1. Foreman needs a restart with every newly installed Gem
    ```bash
    foreman-maintain service restart
    ```

## Usage

Once installed, the management form of Subnets should show additional
fields for setting Local-AS, Remote-AS and Remote-IP values.

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Based off [ForemanPluginTemplate](https://github.com/theforeman/foreman_plugin_template)

Copyright (c) 2024 Xavier Mol

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
