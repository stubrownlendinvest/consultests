# consultests


* To start consul
consul agent -server  -config-dir=/etc/consul.d -bootstrap

* put via consul
consul kv put -http-addr=10.4.1.76:8500 stu/one 7

* get via consul
consul kv get -http-addr=10.4.1.76:8500 stu

* envconsole
envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu  env <scrip which will use the env>
