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
      $cmd https://www.dropbox.com/s/8j26q5yehyvszde/T70-dimer.tgz >T70-dimer.tgz
      $cmd https://www.dropbox.com/s/787hos9vf7w1syy/T70-tetramer.tgz >T70-tetramer.tgz
    endif
  else
    set cmd=`which wget`
    $cmd https://www.dropbox.com/s/8j26q5yehyvszde/T70-dimer.tgz
    $cmd https://www.dropbox.com/s/787hos9vf7w1syy/T70-tetramer.tgz
  endif
endif

exit:
