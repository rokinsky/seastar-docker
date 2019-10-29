# Possible issues
## Problem \#1
```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
SHA256:zOnW/a5sxlyga3zHFZTeZ3Tl+bN8A4TfgVFLZHNWIro.
```
Solution:
```bash
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "[localhost]:6667"
```

## Problem \#2
```
ERROR: Version in "./docker-compose.yml" is unsupported.
```
Solution:

Change `version` in [docker-compose.yml](docker-compose.yml).