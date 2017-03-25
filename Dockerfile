FROM debian

RUN apt-get update && apt-get install -y man-db git make ghostscript

WORKDIR /tmp/iproute2
ADD pdf-gen  .
ADD Makefile .

CMD [ "make", "pdf" ]
