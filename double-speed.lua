-- get the number of selected items
num_items = reaper.CountSelectedMediaItems(0)

-- loop over all selected items
for i = 0, num_items - 1 do
    -- get the current selected item
    item = reaper.GetSelectedMediaItem(0, i)
    
    -- get the current playback rate
    playrate = reaper.GetMediaItemTakeInfo_Value(reaper.GetActiveTake(item), "D_PLAYRATE")
    
    -- set the new playback rate to be half of the current value
    reaper.SetMediaItemTakeInfo_Value(reaper.GetActiveTake(item), "D_PLAYRATE", playrate * 2)
    
    -- get the current length of the item
    length = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    
    -- multiply the length by 2
    reaper.SetMediaItemInfo_Value(item, "D_LENGTH", length / 2)
end

-- update the arrangement (redraw) and recompute the peak cache
reaper.UpdateArrange()
