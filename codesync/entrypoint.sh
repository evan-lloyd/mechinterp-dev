#!/bin/bash

IGNORE_ARGS=""
if [ -n "$IGNORE" ]; then
    IFS=',' read -ra IGNORE_ITEMS <<<"$IGNORE"
    for item in "${IGNORE_ITEMS[@]}"; do
        IGNORE_ARGS="$IGNORE_ARGS -i $item"
    done
fi

if [ -z "$SYNC" ]; then
    # In simple mode, connect /alpha to one BETA
    mutagen sync create --name=code-sync --sync-mode=one-way-safe $IGNORE_ARGS /alpha $BETA
else
    # Parse the comma-delimited list and create syncs for each pair
    IFS=',' read -ra SYNC_PAIRS <<<"$SYNC"

    MONITOR_CMD=""
    for ((i = 0; i < ${#SYNC_PAIRS[@]}; i += 3)); do
        if [ $((i + 2)) -lt ${#SYNC_PAIRS[@]} ]; then
            SOURCE_DIR="${SYNC_PAIRS[i]}"
            TARGET_DIR="${SYNC_PAIRS[i + 1]}"
            USER_GROUP="${SYNC_PAIRS[i + 2]}"
            SYNC_NAME="code-sync-${SOURCE_DIR}"

            # Create a sync with a unique name based on the source directory
            mutagen sync create \
                --name="${SYNC_NAME}" \
                --sync-mode=one-way-safe \
                --default-owner-beta="${USER_GROUP}" \
                --default-group-beta="${USER_GROUP}" \
                $IGNORE_ARGS \
                "/alpha/${SOURCE_DIR}" \
                "${TARGET_DIR}"
        fi
    done
fi

mutagen sync monitor
