#!/bin/sh
sudo rpi-rw
sudo git clone https://github.com/pe1msz/castbin /usr/bin/castbin
sudo mv /usr/bin/castbin/* /usr/bin/. 
sudo rm -r /usr/bin/castbin
sudo chmod +x /usr/bin/cast-avrdude
sudo chmod +x /usr/bin/cast-reset
sudo chmod +x /usr/bin/cast-fan
sudo git clone https://github.com/pe1msz/GMSK-USB /var/www/dashboard/admin/GMSK-USB
sudo mv /var/www/dashboard/admin/GMSK-USB/*  /var/www/dashboard/admin/
sudo rm -r /var/www/dashboard/admin/GMSK-USB
sudo chown -R www-data:www-data /var/www/dashboard/admin/fw
sudo sudo chmod +x /var/www/dashboard/admin/fw/dvmega/flash_mega.sh
cd /var/www/dashboard/admin/fw/pyserial-3.2.1 
sudo python setup.py install
