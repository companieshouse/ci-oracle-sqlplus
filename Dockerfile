# Ex. to build on a Mac:
# docker build        --platform=linux/amd64 -t oraclelinux9-sqlplus -f Dockerfile .

# Ex. to run on a Mac:
# docker run --rm -it --platform=linux/amd64    oraclelinux9-sqlplus

FROM oraclelinux:9-slim

# Install system dependencies.
# (pinned versions to address Hadolint DL3041 warning)

RUN microdnf install -y \
        libaio-0.3.112-2.el9 \
        wget-1.21.1-4.el9 \
        unzip-6.0-55.el9 \
        jq-1.6-17.el9 \
        glibc-langpack-en-2.34-98.el9 && \
    microdnf clean all


# Set environment variables
ENV ORACLE_HOME=/usr/lib/oracle/21/client64 \
    PATH=$PATH:/usr/lib/oracle/21/client64/bin \
    LD_LIBRARY_PATH=/usr/lib/oracle/21/client64/lib

# Get Oracle Instant Client RPMs & install & then remove
RUN wget --progress=dot https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm && \
    wget --progress=dot https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-sqlplus-21.1.0.0.0-1.x86_64.rpm && \
    rpm -ivh oracle-instantclient-basic-*.rpm oracle-instantclient-sqlplus-*.rpm && \
    rm -f oracle-instantclient-*.rpm

CMD ["sqlplus", "-v"]
