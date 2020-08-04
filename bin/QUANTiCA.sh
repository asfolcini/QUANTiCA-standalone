#!/bin/bash
#QUNATiCA starter

if pgrep -x "nats-server" > /dev/null
   then
        #Nats is already active
        echo "nats-server is running..."
   else
        # Nats is not runinng, start it up...
        echo "starting up nats-server..."
        ./nats-server -m 8888 &
        sleep 5
        echo "done."
fi

java -Djava.awt.headless=true -Dlog4j.configurationFile=../config/log4j.properties -cp .:../libs/*:../repo/* quantica.Quantica $1 $2 $3 $4 $5 $6 $7 $8 $9
