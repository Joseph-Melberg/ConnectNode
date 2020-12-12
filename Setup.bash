#/bin/bash
echo "Cleaning up any previous setups"
rm ReverseConnection.bash

echo "Starting setup for ConnectNode"
echo "What port is reserved for this node?"
read reservedport
echo "The port you have chose is $reservedport"

echo "Do you want to generate keys?"

read yn


The rest of this file will go as follows

If a key needs to be generated, then we generate one

If the key needs to be copied, it is copied.

We will have a file that is a template for our resutl, we will copy it to ReverseConnection.bash

we will replace the value in ReverseConnection with reservedport

Symlink ReverseConnection.bash to /etc/network/if-up.d

Something like this will go into the template

#!/bin/sh

FLAGFILE=/var/run/work-was-already-done

case "$IFACE" in
    lo)
        # The loopback interface does not count.
        # only run when some other interface comes up
        exit 0
        ;;
    *)
        ;;
esac

if [ -e $FLAGFILE ]; then
    exit 0
else
    touch $FLAGFILE
fi

: here, do the real work.

