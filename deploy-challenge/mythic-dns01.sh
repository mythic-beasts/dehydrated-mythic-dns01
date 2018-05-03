#!/usr/bin/env bash

# Copyright (C) 2018 Mythic Beasts Ltd

. ../common/mythic-dns01.sh

echo -n "$ARGS" | while read domain filename token; do
    echo " ++ setting DNS for $domain"
    call_api REPLACE _acme-challenge.$domain $token
done
echo -n "$ARGS" | while read domain filename token; do
    echo " ++ waiting DNS for $domain"
    wait_for_dns _acme-challenge.$domain $token
done