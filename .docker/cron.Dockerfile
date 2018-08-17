FROM drupaldocker/php:7.0-cli-2.x

# Add crontab file in the cron directory
ADD ./crontab /usr/share/crontab
RUN touch /var/log/cron.log && chmod a+wr /var/log/cron.log

# Create the log file to be able to run tail
RUN crontab -u www-data /usr/share/crontab

# Run the command on container startup
CMD /usr/sbin/crond -L /var/log/cron.log -b && tail -f /var/log/cron.log

