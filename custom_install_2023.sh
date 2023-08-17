##### Custom foomatic install

# foomatic-datafile location
foom=$(/usr/bin/foomatic-datafile)

# Add the xml files to the foomatic database.
mkdir -p  /usr/share/foomatic/db/source/driver/
mkdir -p /usr/share/foomatic/db/source/opt/
mkdir -p /usr/share/foomatic/db/source/printer/

cp ../foomatic/driver/*  /usr/share/foomatic/db/source/driver/
cp ../foomatic/opt/*     /usr/share/foomatic/db/source/opt/
cp ../foomatic/printer/* /usr/share/foomatic/db/source/printer/

##### Generate PPDs and install them

$foom -t cups -d epl5700l -p 312297          >../foomatic_PPDs/Epson-EPL-5700L-epl5700l-cups.ppd
$foom -t cups -d epl5800l -p Epson-EPL-5800L >../foomatic_PPDs/Epson-EPL-5800L-epl5800l-cups.ppd
$foom -t cups -d epl5900l -p Epson-EPL-5900L >../foomatic_PPDs/Epson-EPL-5900L-epl5900l-cups.ppd
$foom -t cups -d epl6100l -p Epson-EPL-6100L >../foomatic_PPDs/Epson-EPL-6100L-epl6100l-cups.ppd
$foom -t cups -d epl6200l -p Epson-EPL-6200L >../foomatic_PPDs/Epson-EPL-6200L-epl6200l-cups.ppd

gzip -9f ../foomatic_PPDs/Epson-EPL-*-cups.ppd

cp -av ../foomatic_PPDs/Epson-EPL-*-cups.ppd.gz /usr/share/cups/model/
