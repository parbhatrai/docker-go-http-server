FROM python 
COPY app /opt/go-staticsite/app
COPY static /opt/go-staticsite/static
WORKDIR /opt/go-staticsite
ENTRYPOINT ["/opt/go-staticsite/app"]
