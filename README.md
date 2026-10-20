# Backup and restore scripts (lite)

## English

### Purpose

A free slice: incremental rsync snapshots, a restore command, one cron line,
and a short restore note. Database rotation, restic, the systemd timers, and
the full runbook are in the full pack.

### Deliverables

- `deliverables/rsync_backup.sh`
- `deliverables/rsync_restore.sh`
- `deliverables/RESTORE_QUICKSTART.md`
- `examples/crontab.example`

### Quick start

```bash
chmod +x deliverables/*.sh
./deliverables/rsync_backup.sh /srv/app /var/backups/app
./deliverables/rsync_restore.sh /var/backups/app/latest /var/tmp/app-restore
```

The cron example runs that backup at 02:15 as root. Read the quickstart
before restoring onto a directory that already has files. `rsync --delete`
removes destination files that are not in the snapshot.

### Requirements

bash 4.4 or newer, rsync 3.x, and GNU coreutils.

## 中文

### 用途

免费子集：rsync 增量快照、恢复命令、一行 cron，以及一页恢复说明。数据库
轮转、restic、systemd 定时器和完整手册在完整版里。

### 交付清单

- `deliverables/rsync_backup.sh`
- `deliverables/rsync_restore.sh`
- `deliverables/RESTORE_QUICKSTART.md`
- `examples/crontab.example`

### 快速开始

```bash
chmod +x deliverables/*.sh
./deliverables/rsync_backup.sh /srv/app /var/backups/app
./deliverables/rsync_restore.sh /var/backups/app/latest /var/tmp/app-restore
```

cron 示例在 02:15 以 root 运行这份备份。恢复到已有文件的目录之前先读简短说明。
`rsync --delete` 会删掉快照里没有的目标文件。

### 环境要求

bash 4.4 或更高、rsync 3.x、GNU coreutils。

Full version: https://caoyadong-ops.itch.io/backup-restore-scripts

## Delivery time / 交付时间

- Lite (this repo): free, available now. / 精简版（本仓库）：免费，立即可用。
- Full version: instant download after purchase (https://caoyadong-ops.itch.io/backup-restore-scripts). / 完整版：购买后即时下载（https://caoyadong-ops.itch.io/backup-restore-scripts）。


## Full version / 完整版
Full pack (all files + tests) on itch.io: https://caoyadong-ops.itch.io/backup-restore-scripts
完整版（全部文件和测试）在 itch.io：https://caoyadong-ops.itch.io/backup-restore-scripts
