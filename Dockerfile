FROM nginx
COPY . .
CMD ls
CMD envconsul -consul localhost:8500 -sanitize -prefix stu1 env
