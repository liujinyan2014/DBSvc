#include "MongoDBSvc/MongoDBSvc.h"
#include "SniperKernel/SvcFactory.h"
#include "SniperKernel/SniperLog.h"

#include "mongo/client/dbclient.h" // for the driver
#include "MongoDBQuery.h"

#include <iostream>
#include <cstdlib>

#include <algorithm>
using namespace std;

DECLARE_SERVICE(MongoDBSvc);

DatabaseSvc::DatabaseSvc(const std::string& name)
: SvcBase(name)
{
    
    declProp("host",m_hostname);
    declProp("name",m_dbname);

}

MongoDBSvc::~MongoDBSvc()
{
if  (m_query)
  delete m_query;
}


bool
MongoDBSvc::initialize()
{
    m_query = new MongoDBQuery;
    bool result = m_query->connect();
    if (result) {
        LogInfo << "initialize success kkkkk"
        return true; 
    }
        return false;
        LogInfo << "initialize false kkkkk"
}


bool
MongoDBSvc::finalize()
{
    m_query->dis_connect(mydb.testData);

    LogDebug << "MongoDBSvc finalized successfully"
             << std::endl;
    return true;
}


 DatabaseSvc::~DatabaseSvc()
{
   this->finalize();
 }
 
MyMongoDBQuery::QueryResult MongoDBSvc::query(const QueryString& qs)
{
return MyMongoDBQuery::QueryResult result;
}



