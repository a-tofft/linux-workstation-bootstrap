#!/bin/bash
input=$1
while IFS= read -r host
do
  ttab ssh "$host"
done < "$input"
