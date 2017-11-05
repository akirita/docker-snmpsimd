FROM alpine

RUN apk update && \
	apk add --no-cache python3 python3-dev gcc libc-dev && \
	pip3 install --upgrade pip && \
	pip3 install snmpsim && \
	rm -rf /var/cache/apk/* /usr/snmpsim/data

COPY data /usr/share/snmpsim/data

EXPOSE 161/udp

CMD snmpsimd.py --agent-udpv4-endpoint=0.0.0.0:161 --process-user=root --process-group=root $EXTRA_FLAGS

