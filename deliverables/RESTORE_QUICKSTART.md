# Restore quickstart (lite)

1. Stop the program that writes `/srv/app`.
2. List stamps: `ls -l /var/backups/app`.
3. Restore into an empty directory and look:

```bash
mkdir -p /var/tmp/app-restore
./rsync_restore.sh /var/backups/app/latest /var/tmp/app-restore
```

4. When the copy looks right, restore that same stamp onto `/srv/app`.
   The script runs `rsync -a --delete`. Files in `/srv/app` that are not in
   the snapshot are removed.
5. Start the program again.

Database dumps and restic restores are in the full pack.
