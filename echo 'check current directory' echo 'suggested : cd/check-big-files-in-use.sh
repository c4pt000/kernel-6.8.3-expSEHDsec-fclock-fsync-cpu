echo 'check current directory'
echo 'suggested : cd /'
du -h | grep .0G >> bigfiles-inuse.txt
du -h | grep .1G >> bigfiles-inuse.txt
du -h | grep .2G >> bigfiles-inuse.txt
du -h | grep .3G >> bigfiles-inuse.txt
du -h | grep .4G >> bigfiles-inuse.txt
du -h | grep .5G >> bigfiles-inuse.txt
du -h | grep .6G >> bigfiles-inuse.txt
du -h | grep .7G >> bigfiles-inuse.txt
du -h | grep .8G >> bigfiles-inuse.txt
du -h | grep .9G >> bigfiles-inuse.txt
cat bigfiles-inuse.txt
sleep 5 
echo 'rm -rf suggested: bigfiles-inuse.txt'
