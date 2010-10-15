#!/bin/sh
# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
scp $1 districttaco.com:/home/districttaco/media.districttaco.com/$2
