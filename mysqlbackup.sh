sudo mysqldump -uroot -padmin mis | gzip > /tmp/mis_`date '+%m-%d-%Y'`.sql.gz
