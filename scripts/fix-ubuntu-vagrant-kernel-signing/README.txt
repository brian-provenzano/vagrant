Use the scripts here to resign the kernel mods for vagrant after a kernal upgrade on Ubuntu.
I don't know of a better way to handle this after every kernel upgrade so i just use these.



I put them in root's home and chmod them for root's use only

Run (as root) as follows:
1- create the keys (see below), chmod 600 the priv key, put all keys in same dir as scripts
2- script marked 1
3- script marked 2
4 - done, enjoy vagrant working again!!


Create the keys (the CN should be your username):
-------------

openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=YOUR_NAME/"
