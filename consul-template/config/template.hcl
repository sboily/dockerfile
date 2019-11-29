consul = "consul:8500"
token = "a2698ad707066238727de8d3eb7439a5adc459a6638d5b89135751232d34069d"

template {
  source = "/config/nginx.ctmpl"
  destination  = "/usr/local/etc/nginx/"
  command = "nginx -s reload"
}
