# echo "cleanup MongoDBSvc v0 in /home/liujy/juno/offline/Database"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /home/liujy/juno/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtMongoDBSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtMongoDBSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=MongoDBSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtMongoDBSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=MongoDBSvc -version=v0 -path=/home/liujy/juno/offline/Database  $* >${cmtMongoDBSvctempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtMongoDBSvctempfile}
  unset cmtMongoDBSvctempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtMongoDBSvctempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtMongoDBSvctempfile}
unset cmtMongoDBSvctempfile
exit $cmtcleanupstatus

