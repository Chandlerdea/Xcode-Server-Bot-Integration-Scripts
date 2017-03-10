#!/bin/bash

#This would be used for a bot that only runs unit tests

TOTAL_TEST_COUNT=${XCS_TESTS_COUNT}
TOTAL_FAILURE_COUNT=${XCS_TESTS_FAILURE_COUNT}
TOTAL_PASS_COUNT=$((TOTAL_TEST_COUNT - TOTAL_FAILURE_COUNT))

TOTAL_STRING="Executed ${TOTAL_TEST_COUNT} tests"
HEADER="*${XCS_BOT_NAME}* failed integration\n${TOTAL_STRING}"
PASSES_STRING="Passes: ${TOTAL_PASS_COUNT}"
FAILURES_STRING="Failures: ${TOTAL_FAILURE_COUNT}"

PASSES_ATTACHMENT="{\"pretext\":\"${HEADER}\",\"fallback\":\"${PASSSES_STRING}\",\"color\":\"good\",\"text\":\"${PASSES_STRING}\"}"
FAILURES_ATTACHMENT="{\"color\":\"danger\",\"fallback\": \"${FAILURES_STRING}\",\"text\":\"${FAILURES_STRING}\"}"
ATTACHMENTS="[${PASSES_ATTACHMENT},${FAILURES_ATTACHMENT}]"

PAYLOAD="{\"icon_emoji\":\":robot_face:\",\"attachments\": ${ATTACHMENTS}}"
echo $PAYLOAD
curl -X POST -H 'Content-type: application/json' --data ${PAYLOAD} #the url of your slack webhook
