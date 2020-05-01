#!/bin/bash
$ACCNF="$1"
epost -db protein -input "$ACCNF" |efetch -format gb -mode text 
