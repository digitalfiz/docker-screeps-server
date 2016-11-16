#!/bin/bash
set -e

setEnvironmentVariable() {
    key=${1/SCREEPS_/}
    key=${key,,}
    echo "Updating $key to $2"
    sed -i "s/^$key.*/$key = $2/g" .screepsrc
}


if [[ "${SCREEPS_STEAM_API_KEY}" == "" ]]; then
    echo "You must specify a SCREEPS_STEAM_API_KEY to run screeps!"
    exit 1
fi
setEnvironmentVariable 'SCREEPS_STEAM_API_KEY' $SCREEPS_STEAM_API_KEY


for _curVar in `env | grep SCREEPS_ | awk -F = '{print $1}'`;do
    key=${_curVar}
    val=${!_curVar}
    setEnvironmentVariable $key $val
done

echo "Starting screeps..."
screeps start
