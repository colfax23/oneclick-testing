# oneclick installer testing scripts

This contains some scripts, based on Somer's guide, that configure up to getting a beacon node set up for lighthouse on pyrmont.  I havent tested getting a validator up yet, as I haven't thought through handling the validator keys/etc, although I started putting commands into a script for it.

https://someresat.medium.com/guide-to-staking-on-ethereum-2-0-ubuntu-pyrmont-lighthouse-a634d3b87393

CAUTION - I just put these scripts together as a test to automate things, so user at your own risk.  These are *NOT* production worthy.

To run, just run each script in order and wait for it to finish executing.  You might need to respond to some prompts along the way. Many scripts need to be run as root.

Most things are hardcoded (like new SSH port - 10 points to whomever correctly guesses the inspiration of picking that one ;) )

I have run everything on a freshly configured machine running Ubuntu 20.04 and it works.  I have not tested it in any other way.

There are many TODOs for things I think are worth enhancing.  There is much work past the TODOs to make this a production worthy tool.

Happy to have anyone use this as inspiration for their own tool, or for anyone to contribute here.

PRs open :)

