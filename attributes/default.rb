# Little recap on ERB (embed ruby)
# to embed (or interpolate) some ruby you use the ice scream cones <% %>

# There are two tyoes of embed logic.
  # One reutrns something
    # <%= %>
  # The other does not return
    # <% %>

default['nginx']['proxy_port'] = 3000
default['nginx']['proxy_port_secondary'] = 3030
default['nginx']['proxy_port_8080'] = 8080
