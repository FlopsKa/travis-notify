travis-notify
=============

[![Build Status](https://travis-ci.org/FlopsKa/travis-notify.svg?branch=master)](https://travis-ci.org/FlopsKa/travis-notify)

Mediator for the [travis ci](https://travis-ci.org/) service. Caches the latest
POST access of the travis service and returns the `status_message` and the
`build_status` from this request on /notify.

This is supposed to be used as interface for a desktop notification client:
Run this on your server or heroku, point travis to the server url and use
a notification client to receive status updates for your builds.


Made with lots of love by flopska.

