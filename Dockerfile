FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update
RUN apt-get install -qqy wget apt-utils tzdata

RUN wget https://www.reprisesoftware.com/license_admin_kits/x64_l1.admin.tar.gz
RUN tar xvf x64_l1.admin.tar.gz
RUN rm -f x64_l1.admin.tar.gz
RUN cp -f /x64_l1.admin/* /usr/local/rlm/
RUN rm -rf /x64_l1.admin/

VOLUME /opt/rlm/licenses

# rlm server
EXPOSE 5053
# admin gui
EXPOSE 5054
# isv server
EXPOSE 4101

EXPOSE 25053
EXPOSE 25153

COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

CMD ["/opt/start.sh"]
