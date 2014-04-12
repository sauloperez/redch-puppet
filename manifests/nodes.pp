# Messaging Queue
node 'ip-172-31-10-77' {
  include rabbitmq
}

# Webapp
node 'ip-172-31-7-179', 'webapp' {
  include nginx
  include redch
}

# SOS
node 'ip-172-31-8-108' {
  include tomcat
}
