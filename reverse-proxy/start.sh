#!/bin/sh
echo "Starting Apache..."
/usr/sbin/httpd -k start 
echo "Starting SigSci Agent..."
/usr/sbin/sigsci-agent