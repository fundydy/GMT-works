#!/usr/bin/env bash
# GMT modern mode bash template
# Date:    2019-11-13T11:03:39
# User:    root
# Purpose: Purpose of this script
export GMT_SESSION_NAME=$$	# Set a unique session name
gmt begin himalaya ps
	# Place modern session commands here
	#gmt grdimage @earth_relief_01m  -JM20c -R75/95/20/35 -BWSen  -I+d 
	gmt basemap -JM20c -R77/96/25/35 -Bafg -BWSen+t"Data From CMONC" 
	gmt makecpt -Cetopo1
	gmt grdimage @earth_relief_01m -I+d 
	gmt plot color.dat -Si0.4c -Corangered,lightskyblue1,green -W0.5p 
	gmt text site.dat -F+f8p,15,gray10+jML -Dj0.15c/0.15c 
	gmt legend -DjBL+w2.7c+o0.3c/0.3c -F+p1p+gazure1 << EOF
H 9 Timespan /years
G 0.2c
N 2
S 0.4c i 0.4c orangered      0.5p  
L 9p - C 4~8
S 0.4c i 0.4c lightskyblue1  0.5p
L 9p - C 9~10
S 0.4c i 0.4c green    	     0.5p
L 9p - C 19~21
EOF
	#gmt colorbar -Bxa2000f+l"Elevation (m)"
gmt end 
