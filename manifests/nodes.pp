# Messaging Queue
node 'ip-172-31-10-77' {
  include rabbitmq
}

# Webapp
node 'webapp' { 
  include nginx
  include redch
}
