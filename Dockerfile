FROM python:3.6.1-alpine3.6

RUN apk add --no-cache --virtual .build python3 python3-dev gcc libc-dev && \
	pip install snmpsim && \
	apk del .build && \
	rm -rf /root/.cache /var/cache/misc /usr/snmpsim/data /usr/local/snmpsim/data && \
	find /usr/local -depth -name __pycache__ -type d -exec rm -rf {} \;

EXPOSE 161/udp

CMD snmpsimd.py --agent-udpv4-endpoint=0.0.0.0:161 --process-user=root --process-group=root $EXTRA_FLAGS
