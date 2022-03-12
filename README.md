# Contact-Management-App

## Prerequirements

* Visual Studio 2017
* .NET Framework 4.5.2
* SQL Server 2017

## How To Run

* Open solution in Visual Studio 2017 (Open ContactManagerApp folder -->ContactManagerApp.sln)
* Open SQL Server to run the query (Open Database folder -->Database Create Query.sql)
* After opening the web.config file in application, add sample db connection in connectionStrings section like this:
  <connectionStrings>
    <add name="ConnectionStr"
      connectionString="data source=DatabaseServerName; initial catalog=ContactsApp; user id=YourUserName; password=yourpassword; MultipleActiveResultSets=True;"
      providerName="DbClient.Sql; Connection Timeout=6000"/>
  </connectionStrings>
* Set As Start Page as Login.aspx and build the project.
* Run the application.
