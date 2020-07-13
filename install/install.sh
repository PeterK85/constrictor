#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root ...exiting..."
    exit
fi

files=("libg2c.so.0" "libg2c.so.0.0.0" "constrictor")

for file in ${files[*]}
do
    if [ ! -f "$file" ]; then
        echo "$file is not in the current directory"
	exit
    fi
done


echo "Installing 32 bit libraries"

apt-get install lib32z1 -y

echo "Copying files into /usr/lib"

cp libg2c.so.0 /usr/lib/libg2c.so.0
cp libg2c.so.0.0.0 /usr/lib/libg2c.so.0.0.0

echo "Copying constrictor executable to /usr/local/bin"

cp constrictor /usr/local/bin/constrictor

echo "Finished installing"
exit
