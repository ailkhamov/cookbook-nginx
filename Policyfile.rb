# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'node_3'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'node_3::default'

# Specify a custom source for a single cookbook:
cookbook 'node_3', path: '.'

# Import cookbooks from supermarket

cookbook 'nodejs'.'~> 6.0.0'

cookbook 'mongodb', '~> 0.16.2', :supermarket
cookbook 'python', '~> 1.4.6', :supermarket
