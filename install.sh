#! /bin/sh

# exit if a command fails
set -e

# install s3cmd
apk update
apk add --no-cache bash py-pip py-setuptools ca-certificates
pip install python-magic
cd /tmp
wget https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_VERSION}/s3cmd-${S3CMD_VERSION}.tar.gz
tar xzf s3cmd-${S3CMD_VERSION}.tar.gz
cd s3cmd-${S3CMD_VERSION}
python setup.py install

rm -rf /var/cache/apk/* /tmp/s3cmd-${S3CMD_VERSION} /tmp/s3cmd-${S3CMD_VERSION}.tar.gz
