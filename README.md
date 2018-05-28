# Caching HTTPS requests with Varnish on Centos7

Config files for NGINX provided

For this setup we'll be using Varnish's default configs
```
# Default backend definition; /etc/varnish/default.vcl
backend default {
    .host = "127.0.0.1";
    .port = "80";
}
```

```
# Default listening port; /etc/varnish/varnish.params
VARNISH_LISTEN_PORT=6081
```

## Setup Description

```
Client --https:8443--> NGINX Proxy 1 --http:6081--> Varnish --http:8888--> NGINX Proxy 2 --https:9443--> Website
```

## Prerequisites

Install NGINX and Varnish on Centos7
