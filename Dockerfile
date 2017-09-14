FROM billryan/gitbook:base
MAINTAINER Rhett <yuanbin2014@gmail.com>

# add non-root user(workaround for docker)
# replace gid and uid with your currently $GID and $UID
#RUN useradd -m -g 100 -u 1000 gitbook
#USER gitbook

# install gitbook versions
RUN gitbook fetch latest


ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

ADD scripts/run.sh
RUN chmod +x run.sh

CMD ["run.sh"]
