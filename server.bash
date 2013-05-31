function v() {
if [[ -z "$_V" ]] ; then
    # No vim in the background.
    vim --servername vim$$ $@ &
    # Get the JOB number of the vim server!
    _V=$(jobs -l | grep $! | sed -e "s/^\[\(.*\)\].*/\1/")
    fg $_V && unset _V
else
    # There is a v in the background, so we'll resume that and load the new
    # file.
    bash -c "sleep .1 ; vim --servername vim$$ --remote-tab-silent $@ ; \
        vim --servername vim$$ --remote-send ':redraw<CR>'" &
    fg $_V && unset _V
fi
}
