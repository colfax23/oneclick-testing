#!/usr/bin/bash

## Download client (lighthouse)

mkdir ./lighthouse
cd lighthouse

curl --silent "https://api.github.com/repos/sigp/lighthouse/releases/latest" |
        grep browser_download_url |
        cut -d '"' -f 4 |
        grep x86_64-unknown-linux-gnu.tar |
	while read filename
	do
	    echo "Downloading $filename"
	    curl --silent -LO $filename
	done


# TODO: verify pgp signature

tar xvf *tar.gz

cd ..


