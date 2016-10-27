# irc
#

FROM python:2.7-alpine

# create a user
RUN adduser -S irc

ADD https://raw.githubusercontent.com/jrosdahl/miniircd/master/miniircd /usr/local/bin/miniircd
RUN chmod 755 /usr/local/bin/miniircd

USER irc
ENV HOME=/home/irc
WORKDIR /home/irc

EXPOSE 6667
ENTRYPOINT ["/usr/local/bin/miniircd"]
CMD ["--debug", "--verbose"]
