#!/bin/bash
#
# set_alarm.sh
#
# Creates an alarm file with the given configuration.
#
# Parameters:
#   -n|--name      # TODO
#   -s|--sound     # TODO
#   -z|--snooze    # TODO
#   -p|progression # TODO
#   -d|--days      # TODO
#   -t|--time      # TODO
#   -c|--cron
#   --dry

SCRIPT_DIR=`dirname $0`

# Parse args
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -d|--days)
      DAYS="$2"
    shift # past argument
    ;;
    -t|--time)
      TIME="$2"
    shift # past argument
    ;;
    -c|--cron)
      CRON="$2"
    shift # past argument
    ;;
    --dry)
      DRY=true
    ;;
    *)
    # unknown option
      echo "Unrecognized option: $2"
      exit 1
    ;;
esac
shift # past argument or value
done

#if [[ -n $1 ]]; then
#    echo "Last line of file specified as non-opt/last argument:"
#    tail -1 $1
#fi


# TODO: Validation of input
echo "Setting alarm"

if [ -n "$CRON" ];then
  CRON_STRING="$CRON"
else
  CRON_STRING="" # TODO pull from date/time
fi

if [ ! -n "$CRON_STRING" ];then
  echo "Error: Invalid schedule setting"
  exit 1
fi

ABS_SCRIPT_PATH="$(dirname $(realpath $0))"
ALARM_FILE="$ABS_SCRIPT_PATH/../config/alarm_config/1.alarm" #TODO: Generate a new alarm file each time
echo "name: test" > "$ALARM_FILE" # Empty file to start
echo "sound: default" >> "$ALARM_FILE"
echo "snooze: default" >> "$ALARM_FILE"
echo "progression: default" >> "$ALARM_FILE"

FULL_CRON="$CRON_STRING $ABS_SCRIPT_PATH/start_alarm.sh $ALARM_FILE"
if [ -n "$DRY" ];then
  echo "$FULL_CRON"
else
  if crontab -l 2>&1 > /dev/null ; then
    crontab -l > tmp_crontab
  else
    echo "" > tmp_crontab
  fi

  echo "$FULL_CRON" >> tmp_crontab
  crontab tmp_crontab || exit 1
  rm tmp_crontab
fi

echo "Alarm set"

