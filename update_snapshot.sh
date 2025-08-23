#!/bin/bash
set -e

echo -e '\n╔════════════════════════════════════════════════╗'
echo -e '║          ★★ 👑 Ntek Storage Node 👑 ★★         ║'
echo -e '╚════════════════════════════════════════════════╝\n'

# Stop service
sudo systemctl stop zgs

# Clear old DB
rm -rf $HOME/0g-storage-node/run/db/flow_db

# Download latest snapshot
wget -q --show-progress https://snapshot.corenodehq.xyz/0g_testnet/flow_db.tar.gz -O $HOME/0g-storage-node/run/db/flow_db.tar.gz

# Extract
tar -xzvf $HOME/0g-storage-node/run/db/flow_db.tar.gz -C $HOME/0g-storage-node/run/db/

# Remove tar file
rm -f $HOME/0g-storage-node/run/db/flow_db.tar.gz

# Restart services
sudo systemctl start zgs

# Status check
sudo systemctl status zgs --no-pager -l

echo -e '\n✅ Snapshot restored successfully 🚀'
echo -e '✨ Made by Ntek ✨'
echo -e '╔════════════════════════════════════════════════╗'
echo -e '║          ★★ 👑 Ntek Storage Node 👑 ★★         ║'
echo -e '╚════════════════════════════════════════════════╝\n'
