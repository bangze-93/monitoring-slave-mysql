# Monitoring Slave MySQL/MariaDB

This monitoring will send notification to Telegram

```bash
chmod +x mon-slave.sh
```
 
Run script from cronjob

```bash
* * * * * /monitoring/db/mon-slave.sh
```
