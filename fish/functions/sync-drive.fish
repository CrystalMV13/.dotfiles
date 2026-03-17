function sync-drive -d "sync Google Drives"
    for remote in crystalmv13 hauntedbunnies cm123
        rclone sync -L --drive-export-formats="docx,xlsx,pptx,svg" "$remote:" "$argv[1]/$remote"
    end
end

