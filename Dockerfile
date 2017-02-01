FROM nginx
COPY . .
CMD ls
CMD ./envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu1 env
