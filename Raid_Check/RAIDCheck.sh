 #!/bin/bash
 ###########################################################
 #        NetSort RAID Drive Check
 #
 #        Author : Steve Seburn
 #        Date   : 2012-09-27
 #        Version : 1.00
 #
 #        Requires Adaptec StorMan software installed
 #
 ###########################################################
 
fndate=$(date +%Y%m%d)
basedir='/usr/StorMan'

#insure we are root
if [ ! $( id -u ) -eq 0 ]; then
  echo Not running as root, please restart using sudo
  exit 0
fi
echo Running as root, not elevating privileges

cd $basedir

echo Overall Summary
echo
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getconfig 1 AL | grep 'Status of logical device' | grep Optimal
if [ $? -ne 0 ]; then
     echo ARRAY IS DEGRADED, IMMEDIATE ACTION REQUIRED
     echo
     echo
fi
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getconfig 1 AL | grep -e 'Status of logical device' -e 'Logical devices/Failed/Degraded' -e 'Failed stripes' -e ' Segment ' -e 'Logical device name'


echo
echo Current Device Logs
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getlogs 1 DEVICE

echo
echo Current Full Statistics
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getconfig 1 AL

echo
echo Current Full Smart Statistics
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1

echo
echo Current Operation and Status
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getstatus 1

echo
echo Information on DEAD Devices
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getlogs 1 DEAD

echo
echo Following device statistics are in this order
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep '<PhysicalDrive'

echo
echo 'SMART Stats Reallocated Sector Counts (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x05

echo
echo 'SMART Stats Reported Uncorrectable Errors (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xBB

echo
echo 'SMART Stats End to End Error Rate (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xB8

echo
echo 'SMART Stats Read Error Rate (Should be close to zero) Unreliable on Seagate Drives'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x01

echo
echo 'SMART Stats Seek Error Rate (Should be zero) Unreliable on Seagate Drives'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x07

echo
echo 'SMART Stats Power On Hours'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x09

echo
echo 'SMART Stats Spin Retry Count (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x0A

echo
echo 'SMART Stats Power Cycle Count'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x0C

echo
echo 'SMART Stats Soft Read Error Rate (Lower is better)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0x0D

echo
echo 'SMART Stats HDD Command Timeouts (Should be close to zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xBC

echo
echo 'SMART Stats High Fly Writes (Should be close to zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xBD

echo
echo 'SMART Stats uncorrectable Sector Counts (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xC6

echo
echo 'SMART Stats Current Pending Sector Remap Counts (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xC5

echo
echo 'SMART Stats Cabling CRC Errors (Should be zero)'
LD_LIBRARY_PATH="/usr/StorMan" ./arcconf getsmartstats 1 | grep 0xC7






 