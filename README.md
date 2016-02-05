# raizyr/s3cmd
A Lightweight container with s3cmd

[![wercker status](https://app.wercker.com/status/39167e82ba26b179e6d5312bd27cacda/m/master "wercker status")](https://app.wercker.com/project/bykey/39167e82ba26b179e6d5312bd27cacda)

## Purpose
This container was designed to be used with [wercker](http://wercker.com) as a deployment pipeline container, but it certainly could be used for any s3cmd needs.

## Alpine Linux
This container is derived from [Alpine Linux](http://www.alpinelinux.org/) and has added the `bash` shell.  If you would rather save the ~0.69MB you can use s3cmd:sh, however because wercker uses /bin/bash for their setup steps, you must override the box cmd as shown in the sample *wercker.yml* below.

## Sample *wercker.yml*

  deploy:
    box: raizyr/s3cmd
    steps:
      - raizyr/s3sync:
          source_dir: public/
          delete-removed: true
          bucket-url: $AWS_BUCKET_URL
          key-id: $AWS_ACCESS_KEY_ID
          key-secret: $AWS_SECRET_ACCESS_KEY
  # Or without bash
  deploy:
    box: 
      id: raizyr/s3cmd
      cmd: /bin/sh
    steps:
      - raizyr/s3sync:
          source_dir: public/
          delete-removed: true
          bucket-url: $AWS_BUCKET_URL
          key-id: $AWS_ACCESS_KEY_ID
          key-secret: $AWS_SECRET_ACCESS_KEY
