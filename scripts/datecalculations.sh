#!/bin/bash

# datecalculations.sh
# Author: Luciano Sardanha
# Use it freely 

MPHR=60 # minutes per hour
HPD=24 # hours per day.

CURRENTDATE=`date +%Y-%m-%d`
CURRENTTIME=`date +%H:%M:%S`
CURRENTYEAR=`date +%Y`


diff () {
        printf '%s' $(( $(date -u -d"$TARGET" +%s) -
                        $(date -u -d"$CURRENT" +%s)))
#                       %d = day of month.
}
#changing date to English:
LC_TIME=en_US.UTF-8
CURRENT=$(date -u -d "${CURRENTDATE} ${CURRENTTIME}" '+%F %T.%N %Z')
TARGET=$(date -u -d "${CURRENTYEAR}-12-25 12:30:00" '+%F %T.%N %Z')

# %F = full date, %T = %H:%M:%S, %N = nanoseconds, %Z = time zone.

printf "\nIn ${CURRENTYEAR}, %s " \
       "$(date -d"$CURRENT +
        $(( $(diff) /$MPHR /$MPHR /$HPD / 2 )) days" '+%d %B')" 
#       %B = name of month                ^ halfway 
printf 'is halfway between %s ' "$(date -d"$CURRENT" '+%d %B')"
printf 'and %s\n' "$(date -d"$TARGET" '+%d %B')"

printf '\nOn %s at %s, there are\n' \
        $(date -u -d"$CURRENT" +%F) $(date -u -d"$CURRENT" +%T)
DAYS=$(( $(diff) / $MPHR / $MPHR / $HPD ))
CURRENT=$(date -d"$CURRENT +$DAYS days" '+%F %T.%N %Z')
HOURS=$(( $(diff) / $MPHR / $MPHR ))
CURRENT=$(date -d"$CURRENT +$HOURS hours" '+%F %T.%N %Z')
MINUTES=$(( $(diff) / $MPHR ))
CURRENT=$(date -d"$CURRENT +$MINUTES minutes" '+%F %T.%N %Z')
printf '%s days, %s hours, ' "$DAYS" "$HOURS"
printf '%s minutes, and %s seconds ' "$MINUTES" "$(diff)"
printf 'until Christmas Dinner!\n\n'

#  Exercise:
#  --------
#  Rewrite the diff () function to accept passed parameters,
#+ rather than using global variables.


