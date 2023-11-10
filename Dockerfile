FROM    nginx

COPY    default.conf /etc/nginx/conf.d/
COPY    index.html /usr/share/nginx/html/
COPY    504.html /usr/share/nginx/html/
COPY    board.html /usr/share/nginx/html/
COPY    login.html /usr/share/nginx/html/
COPY    logout.html /usr/share/nginx/html/
COPY    main.html /usr/share/nginx/html/
COPY    organization.html /usr/share/nginx/html/
COPY    register.html /usr/share/nginx/html/
COPY    write.html /usr/share/nginx/html/
COPY    board.css /usr/share/nginx/html/
COPY    login.css /usr/share/nginx/html/
COPY    table.css /usr/share/nginx/html/
COPY    register.css /usr/share/nginx/html/

ADD     temp /usr/share/nginx/html/

EXPOSE  80
