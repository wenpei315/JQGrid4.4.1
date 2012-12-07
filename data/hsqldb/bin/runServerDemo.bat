cd ..\data
@java -classpath ../lib/hsqldb.jar org.hsqldb.server.Server -port 9001 -database.0 file:../data/demodb -dbname.0 demodb
