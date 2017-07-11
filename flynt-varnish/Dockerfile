FROM alpine:3.6

RUN apk update && \
    apk upgrade && \
    apk add varnish

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

EXPOSE 80
CMD exec varnishd -F \
  -f $VCL_CONFIG \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS
