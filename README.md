# consultests


CMD /usr/sbin/apache2ctl -k start &amp;&amp; envconsul -config=/etc/envconsul.cnf -sanitize=false -upcase=false myblog env /usr/local/tomcat/bin/catalina.sh run
