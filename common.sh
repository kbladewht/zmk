#!/bin/bash
# common.sh

polling_check(){
    # Note: This function depends on the variable DRIVE_P being set in the caller's environment
    local count=0
    
    # Default DRIVE_P if not set (optional safety check)
    if [ -z "$DRIVE_P" ]; then
        echo "Warning: DRIVE_P is not set. Defaulting to F."
        DRIVE_P="F"
    fi

    while [ ! -f ${DRIVE_P}:/CURRENT.UF2 ] && [ ! -f E:/CURRENT.UF2 ] ; do
        sleep 2
        count=$((count + 1))

        if [ $count -gt 100 ]; then
            echo -e "\nBeyond attempt, break current build..."
            return 1
        fi

        if (( count == 1 )); then
            echo "Looking up Drive $DRIVE_P, polling ...every 2 seconds"
            echo -n "Detecting..."
            continue
        fi

        echo -n "."

    done

    # Set DRIVE_P to E if F: is not available but E: is
    if [ ! -f ${DRIVE_P}:/CURRENT.UF2 ] && [ -f E:/CURRENT.UF2 ]; then
        DRIVE_P="E"
    fi
    
    echo -e "\nDevice detected on drive: ${DRIVE_P}:"
    return 0
}