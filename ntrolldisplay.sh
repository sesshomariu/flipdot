while true; do
	#!/bin/sh
	
	convert $1 -resize 144x120 -gravity center -background black -extent 144x120 -rotate 90 $1.pbm
	
	#pnmsmooth $1.pbm > $1.smooth.pgm
	#convert  $1.smooth.pgm  $1.smooth.pbm
	#pnminvert $1.smooth.pbm > $1.inv.pbm
	
	pnminvert $1.pbm > $1.inv.pbm
	tail -n +3 $1.inv.pbm > $1.bin
	
	dd if=$1.bin skip=0 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:feb9:db12 2323 &
	dd if=$1.bin skip=1 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:fe23:60d7 2323 &
	dd if=$1.bin skip=2 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:fe71:dd32 2323 &
	echo 'Sending parts of '$1' to all panels'
#	sleep 1.5
	#!/bin/sh
	
	convert $1 -resize 144x120 -gravity center -background black -extent 144x120 -rotate 90 $1.pbm
	
	#pnmsmooth $1.pbm > $1.smooth.pgm
	#convert  $1.smooth.pgm  $1.smooth.pbm
	#pnminvert $1.smooth.pbm > $1.inv.pbm
	
	pnminvert $1.pbm > $1.inv.pbm
	tail -n +3 $1.inv.pbm > $1.bin
	
	dd if=$1.bin skip=0 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:feb9:db12 2323 &
	dd if=$1.bin skip=1 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:fe23:60d7 2323 &
	dd if=$1.bin skip=2 bs=720 count=1 2>/dev/null | nc -u -w 1 2001:67c:20a1:1095:ba27:ebff:fe71:dd32 2323 &
	echo 'Sending parts of '$1' to all panels'
#	sleep 1.5
done
