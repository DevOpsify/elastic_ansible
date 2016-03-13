#!/bin/bash
source /etc/environment

while [[ $# -gt 1 ]]
do
    INPUT="$1"
    case $INPUT in
        -a|--app)
        APP="$2"
        shift
        ;;
        * )
        # Unknown
        ;;
    esac
    shift
done

do_help () {
    echo " "
    echo "./start_logging_app.sh -a [elasticsearch|filebeat|kibana|logstash|redis]"
    echo " "
    exit 1
}

start_app(){
    # Generate properties
    /root/bin/gen_app_properties.sh ${ENV} logging_${APP}
    docker-compose -f /root/bin/logging/docker-compose_${APP}.yml pull
    docker-compose -f /root/bin/logging/docker-compose_${APP}.yml up -d
}

case $APP in
    elasticsearch|filebeat|kibana|logstash|redis ) start_app
        ;;
    * ) do_help
        ;;
esac
