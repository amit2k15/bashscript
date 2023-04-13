Hi Sheryl/Teja,
I am writing to seek your opinion on a proposed plan to split the Zabbix stage upgrade activity from version 5.0 to 6.0. To mitigate risks and ensure smooth implementation, the DB team has recommended splitting these tasks into two phases. After consulting with the DB team, we have identified two critical tasks that need to be completed in order to ensure a successful upgrade. The first task is the conversion of current PXE setup to Proxy SQL, which requires careful planning and execution. The second task is the actual upgrade of Zabbix from version 5.0 to 6.0.
Phase 1: PXE to Proxy SQL conversion
1)	Need to take Application down time for 2 to 3 hours.
2)	Need to Stop Zabbix web and Application Service before starting the activity.
3)	DB team will perform the cutover and conversion activity.
4)	After the activity we will resume the Zabbix web and application service.
5)	Once Zabbix is available we will validate the Zabbix performance and historical data.

Note: 
1)	During maintenance window Zabbix proxy will hold the collected data and will sync with Zabbix server once the activity is done.
2)	As per DB team they can available only during weekdays for stage instance activity
Phase 2: Zabbix Version upgradation from 5.0 to 6.0
1)	Need to take Application down time for 5 to 6 hours
2)	Need to Stop Zabbix web, Application and Database Service before starting the activity.
3)	Database team need to provide full privilege to the DB user for auto upgradation of Zabbix DB schema
4)	Need to point new Web and Application servers to the Zabbix Database.
5)	Need to start Zabbix web, app and DB server for auto upgradation from 5.0 to 6.0
6)	Need to Upgrade Zabbix proxies from 5.0 to 6.0 and map to new Zabbix stage instance
7)	Need to check the Zabbix performance and data for monitors present in Zabbix.

Note: 
3)	We need to raise an Incident to change the DNS for new Zabbix webserver for SAML.
4)	We may lose monitoring data during proxy upgradation from 5.0 to 6.0

This approach will allow us to carefully validate the Proxy SQL setup and ensure its stability before proceeding with the Zabbix upgrade. 
I would appreciate your input and opinion on this proposed plan. Your guidance and expertise would be invaluable in making an informed decision. Please let us know if you have any concerns or suggestions regarding this approach.



