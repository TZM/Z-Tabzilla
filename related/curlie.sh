#!/bin/bash
#
# Copyright 2012 Google Inc. All Rights Reserved.


function ClientLogin() {
  read -p 'Email> ' email
  read -p 'Password> ' -s password
  local service=$1
  curl -s -d Email=$email -d Passwd=$password -d service=$service https://www.google.com/accounts/ClientLogin | tr ' ' \n | grep Auth= | sed -e 's/Auth=//'
}

function FusionTableQuery() {
  local sql=$1
  curl -L -s -H "Authorization: GoogleLogin auth=$(ClientLogin fusiontables)" --data-urlencode sql="$sql" https://www.google.com/fusiontables/api/query > olol.csv
}

FusionTableQuery "SELECT * FROM 1epTUiUlv5NQK5x4sgdy1K47ACDTpHH60hbng1qw"