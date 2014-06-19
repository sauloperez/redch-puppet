# Messaging Queue
node 'ip-172-31-10-77' {
  include rabbitmq
}

# Webapp
node 'ip-172-31-7-179' {
  include nginx
  include redch
}

# SOS
node 'ip-172-31-32-159' {
  include tomcat
  include sos
}
