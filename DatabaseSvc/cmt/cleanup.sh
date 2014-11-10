# echo "cleanup DatabaseSvc v0 in /home/liujy/juno/offline/Database"

if test "${CMTROOT}" = ""; then
  CMTROOT=/home/liujy/juno/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtDatabaseSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtDatabaseSvctempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=DatabaseSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtDatabaseSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=DatabaseSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtDatabaseSvctempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtDatabaseSvctempfile}
  unset cmtDatabaseSvctempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtDatabaseSvctempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtDatabaseSvctempfile}
unset cmtDatabaseSvctempfile
return $cmtcleanupstatus

