#!/bin/bash




















SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do 
      DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
      SOURCE="$(readlink "$SOURCE")"
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" 
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


. $DIR/lib.sh 


init_ipt_chains 
add_new_rules

> $PORTS_ALREADY_BAN
> $PORTS_ALIVE
cal_alive

ISFIRST=1;
while true; do
# 是否第一次运行，第一次则生成临时流量记录
    cal_alive
    sleep $INTERVEL 

done

