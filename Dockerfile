FROM nginx
COPY . .
CMD yum envconsul envconsul -consul localhost:8500 -sanitize -prefix stu1/stu2
