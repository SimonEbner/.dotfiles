# Create an alias that starts audacious after saving DBUS address
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    if [ -e "$HOME/.dbusAddr" ]; then
        export DBUS_SESSION_BUS_ADDRESS=`cat ~/.dbusAddr`
    fi
else
    echo $DBUS_SESSION_BUS_ADDRESS > ~/.dbusAddr
fi
