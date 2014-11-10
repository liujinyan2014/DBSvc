#ifndef MONGODBSVC_H
#define MONGODBSVC_H

#include "SniperKernel/SvcBase.h"

#include <string>

class MongoDBQuery;

class DatabaseSvc : public SvcBase {

    public:
        DatabaseSvc(const std::string& name);
        ~DatabaseSvc();
        MyMongoDB::QueryResult query();
        MyMongoDB::QueryResult query(const QueryString& qs);

        bool initialize();
        bool finalize();

     private:
        std::string m_hostname;
        std::string m_dbname;
        MongoDBQuery* m_query;
};

#endif

