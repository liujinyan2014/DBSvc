# echo "setup DatabaseSvc v0 in /home/liujy/juno/offline/Database"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /home/liujy/juno/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtDatabaseSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtDatabaseSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=DatabaseSvc -version=v0 -path=/home/liujy/juno/offline/Database  -no_cleanup $* >${cmtDatabaseSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=DatabaseSvc -version=v0 -path=/home/liujy/juno/offline/Database  -no_cleanup $* >${cmtDatabaseSvctempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtDatabaseSvctempfile}
  unset cmtDatabaseSvctempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtDatabaseSvctempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtDatabaseSvctempfile}
unset cmtDatabaseSvctempfile
exit $cmtsetupstatus

