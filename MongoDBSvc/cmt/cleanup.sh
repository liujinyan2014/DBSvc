# echo "cleanup MongoDBSvc v0 in /home/liujy/juno/offline/Database"

if test "${CMTROOT}" = ""; then
  CMTROOT=/home/liujy/juno/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtMongoDBSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtMongoDBSvctempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=MongoDBSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtMongoDBSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=MongoDBSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtMongoDBSvctempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtMongoDBSvctempfile}
  unset cmtMongoDBSvctempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtMongoDBSvctempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtMongoDBSvctempfile}
unset cmtMongoDBSvctempfile
return $cmtcleanupstatus

