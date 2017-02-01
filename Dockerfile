FROM nginx
COPY . .
CMD envconsul -consul localhost:8500 -sanitize -prefix stu1/stu2
