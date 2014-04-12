class sos {
  exec { 'adduser ubuntu admin' }
  exec { 'chgrp admin /var/www' }
  exec { 'chmod g+x /var/www' }
}
