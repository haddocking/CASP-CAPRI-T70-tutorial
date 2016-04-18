#!/bin/csh
#
set found=`which wget |grep -v found |wc -l`
  if ($found == 0) then
    set found=`which curl |grep -v found |wc -l`
    if ($found == 0) then
      echo 'No curl nor wget found in your system'
      echo 'Unable to download expample data'
      goto exit
    else
      set cmd=`which curl`
      $cmd https://www.dropbox.com/s/u5ap3yu7hpoyfrn/T70-dimer-full.tgz >T70-dimer-full.tgz
      $cmd https://www.dropbox.com/s/ygg7l4l1xqms9gy/T70-tetramer-full.tgz >T70-tetramer-full.tgz
    endif
  else
    set cmd=`which wget`
    $cmd https://www.dropbox.com/s/u5ap3yu7hpoyfrn/T70-dimer-full.tgz
    $cmd https://www.dropbox.com/s/ygg7l4l1xqms9gy/T70-tetramer-full.tgz
  endif
endif

exit:
