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
      $cmd -L https://surfdrive.surf.nl/files/index.php/s/t7wIYpuddJqhlFn/download > T70-dimer-full.tgz
      $cmd -L https://surfdrive.surf.nl/files/index.php/s/NQe3VPuPF05iFVY/download > T70-tetramer-full.tgz
    endif
  else
    set cmd=`which wget`
    $cmd  https://surfdrive.surf.nl/files/index.php/s/t7wIYpuddJqhlFn/download -O T70-dimer-full.tgz
    $cmd https://surfdrive.surf.nl/files/index.php/s/NQe3VPuPF05iFVY/download -O T70-tetramer-full.tgz
  endif
endif

exit:
