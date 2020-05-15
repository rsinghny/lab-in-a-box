FROM alpine:latest

#Compile nginx
ARG NGINX_VERSION
ENV NGINX_VERSION="${NGINX_VERSION:-1.10.2}"
ARG NGINX_LUA
ENV NGINX_LUA="${NGINX_LUA:-0.10.7}"
ARG NGINX_DEVEL
ENV NGINX_DEVEL="${NGINX_DEVEL:-0.3.0}"
ARG LUAJIT
ENV LUAJIT="${LUAJIT:-2.0.4}"
ARG top="${PWD}"
ARG tmpdir="/tmp/nginx"
ARG install_packages="make curl wget gcc libc-dev openssl-dev pcre-dev zlib-dev linux-headers gnupg libxslt-dev gd-dev geoip-dev perl-dev luajit-dev ca-certificates"
ARG modules_path="/etc/nginx/modules"
WORKDIR ${tmpdir}
RUN set -ex \
  && apk update \
  && apk add ${install_packages} \
  && update-ca-certificates \
  && addgroup -S nginx \
  && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
  && wget -nv -O LuaJIT-${LUAJIT}.tar.gz https://luajit.org/download/LuaJIT-${LUAJIT}.tar.gz \
  && wget -nv -O nginx-${NGINX_VERSION}.tar.gz https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
  && wget -nv -O lua-nginx-module-${NGINX_LUA}.tar.gz https://github.com/openresty/lua-nginx-module/archive/v${NGINX_LUA}.tar.gz \
  && wget -nv -O ngx_devel_kit-${NGINX_DEVEL}.tar.gz https://github.com/simpl/ngx_devel_kit/archive/v${NGINX_DEVEL}.tar.gz \
  && tar -xf LuaJIT-${LUAJIT}.tar.gz \
  && tar -xf lua-nginx-module-${NGINX_LUA}.tar.gz \
  && tar -xf ngx_devel_kit-${NGINX_DEVEL}.tar.gz \
  && tar -xf nginx-${NGINX_VERSION}.tar.gz \
  && cd ${tmpdir}/LuaJIT-${LUAJIT} && make amalg BUILDMODE=static CC="gcc -fPIC" \
  && cp ${tmpdir}/LuaJIT-${LUAJIT}/src/libluajit.a ${tmpdir}/LuaJIT-${LUAJIT}/src/libluajit-5.1.a \
  && cd ${tmpdir}/nginx-${NGINX_VERSION} && LUAJIT_LIB=${tmpdir}/LuaJIT-${LUAJIT}/src LUAJIT_INC=${tmpdir}/LuaJIT-${LUAJIT}/src ./configure \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--modules-path=${modules_path} \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_auth_request_module \
--with-threads \
--with-stream \
--with-stream_ssl_module \
--with-http_slice_module \
--with-file-aio \
--with-ipv6 \
--with-http_v2_module \
--with-cc-opt='-O2 -g -pipe -Wall -fexceptions -m64 -mtune=generic -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector-strong -fPIE' \
--with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now  -fPIE -pie' \
  && cd ${tmpdir}/nginx-${NGINX_VERSION} && make -f objs/Makefile binary \
  && cp ./objs/nginx ./objs/nginx-pie \
  && cd ${tmpdir}/nginx-${NGINX_VERSION} && LUAJIT_LIB=${tmpdir}/LuaJIT-${LUAJIT}/src LUAJIT_INC=${tmpdir}/LuaJIT-${LUAJIT}/src ./configure \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--modules-path=${modules_path} \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_auth_request_module \
--with-threads \
--with-stream \
--with-stream_ssl_module \
--with-http_slice_module \
--with-file-aio \
--with-ipv6 \
--with-http_v2_module \
--with-cc-opt='-O2 -g -pipe -Wall -fexceptions -m64 -mtune=generic -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector-strong' \
--with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now ' \
--add-dynamic-module=../ngx_devel_kit-${NGINX_DEVEL} \
--add-dynamic-module=../lua-nginx-module-${NGINX_LUA} \
  && cd ${tmpdir}/nginx-${NGINX_VERSION} && make && make install \
  && cp ./objs/nginx-pie /usr/sbin/nginx \
  && cp /usr/sbin/nginx /usr/sbin/nginx-debug \
  && strip /usr/sbin/nginx \
  && chmod a-x ${modules_path}/ndk_http_module.so ${modules_path}/ngx_http_lua_module.so \
  && cp ${modules_path}/ndk_http_module.so ${modules_path}/ndk_http_module-debug.so \
  && cp ${modules_path}/ngx_http_lua_module.so ${modules_path}/ngx_http_lua_module-debug.so \
  && strip ${modules_path}/ndk_http_module.so ${modules_path}/ngx_http_lua_module.so \
  && ls -l /usr/sbin/nginx ${modules_path} \
  && /usr/sbin/nginx -V \
  && mkdir -p /var/cache/nginx/client_temp \
  && rm -rf ${tmpdir}

#Add SigSci module
RUN mkdir -p /opt/sigsci/nginx
RUN cd /opt/sigsci/nginx && curl -O https://dl.signalsciences.net/sigsci-module-nginx/sigsci-module-nginx_latest.tar.gz && tar -xvzf sigsci-module-nginx_latest.tar.gz && mv /opt/sigsci/nginx/sigsci-module-nginx/* /opt/sigsci/nginx/

#download and unpack SigSci Agent
RUN cd /usr/sbin && curl -O https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvzf sigsci-agent_latest.tar.gz


RUN  mkdir /app && mkdir /etc/sigsci && mkdir /etc/nginx/sites-enabled
COPY app/nginx.conf /etc/nginx/nginx.conf
COPY app/default.conf /etc/nginx/sites-enabled/default.conf
COPY app/index.html /usr/share/nginx/html/index.html
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]

