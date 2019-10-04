#!/usr/bin/env bash
mysqldump example > dump.sql
mysql sample < dump.sql
mysqldump mysql > dump1.sql help_keyword --where 'help_keyword_id < 100'
