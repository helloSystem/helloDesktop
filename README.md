# helloDesktop [![Build Status](https://api.cirrus-ci.com/github/helloSystem/helloDesktop.svg)](https://cirrus-ci.com/github/helloSystem/helloDesktop)

```
sudo su
cat > /usr/local/etc/pkg/repos/helloDesktop.conf <<\EOF
helloDesktop: {
        url: "pkg+https://api.cirrus-ci.com/v1/artifact/github/helloSystem/helloDesktop/pkg/binary/${ABI}",
        mirror_type: "srv",
        enabled: yes,
        priority: 100
}
EOF
exit

sudo pkg install hellodesktop
```

__NOTE:__ This is work in progress. Configuration and startup script for the user session are currently missing.
