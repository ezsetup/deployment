FROM postgres:9.6

# To deploy a fresh db:
#  COPY init.sql /docker-entrypoint-initdb.d 

# To restore a backup:
COPY 0000-2018-03-12.sql /docker-entrypoint-initdb.d

# Apply migrations
COPY migrations/0002_2018_02_01_alter_table_scenarios.sql /docker-entrypoint-initdb.d
COPY migrations/0003_2018_03_01_alther_table_labs.sql /docker-entrypoint-initdb.d
