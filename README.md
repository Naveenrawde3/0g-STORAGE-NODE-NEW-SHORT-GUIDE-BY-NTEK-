# 0g-STORAGE-NODE-NEW-SHORT-GUIDE-BY-NTEK-

> 🧠 Created by NTEK — Join our Telegram: [t.me/ntekearning2](https://t.me/ntekearning2)


## 💻 SYSTEM REQUIRMENT :

- Linux VPS (Ubuntu 20.04 or later)
- Minimum hardware: 4-core CPU, 8GB RAM, 200GB SSD


## ⚙️ PRE-SETUP

### 🟢 Add 0G RPC:

```
https://chainscan-galileo.0g.ai/
```

### 💧 GET FAUCET :

```
https://faucet.0g.ai/
```

### 🖥️ 0G NODE (ONE CLICK COMMAND)

## 1. ALL INSTALLTION :

```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt install curl iptables build-essential git wget lz4 jq make protobuf-compiler cmake gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev screen ufw -y && curl https://sh.rustup.rs -sSf | sh -s -- -y && source $HOME/.cargo/env && rustc --version && wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz && \
sudo rm -rf /usr/local/go && \
sudo tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz &&  
rm go1.24.3.linux-amd64.tar.gz && \
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && \
source ~/.bashrc && go version && git clone https://github.com/0glabs/0g-storage-node.git && cd 0g-storage-node && git checkout v1.1.0 && git submodule update --init && cargo build --release && rm -rf $HOME/0g-storage-node/run/config.toml && curl -o $HOME/0g-storage-node/run/config.toml https://raw.githubusercontent.com/Naveenrawde3/0G-LABS-STORAGE-NODE-RUN-GUIDE-BY-NTEK/main/config.toml && nano $HOME/0g-storage-node/run/config.toml
````

## 🌐 CHANGE RPC + ADD PRIVATE KEY :

* Visit: [https://www.astrostake.xyz/0g-status](https://www.astrostake.xyz/0g-status)

 ## 🛠  2. SETUP A SYSTEM SERVICE 

```bash
sudo tee /etc/systemd/system/zgs.service > /dev/null <<EOF
[Unit]
Description=ZGS Node
After=network.target

[Service]
User=$USER
WorkingDirectory=$HOME/0g-storage-node/run
ExecStart=$HOME/0g-storage-node/target/release/zgs_node --config $HOME/0g-storage-node/run/config.toml
Restart=on-failure
RestartSec=10
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
````

## RELOA & ENABLE & START SERVICE :

```
sudo systemctl daemon-reload
```

```
sudo systemctl enable zgs
```

```
sudo systemctl start zgs
```

## 4. 🧪 SNAPSHORT COMMAND :

```bash
curl -fsSL https://raw.githubusercontent.com/Naveenrawde3/0g-STORAGE-NODE-NEW-SHORT-GUIDE-BY-NTEK-/main/update_snapshot.sh | sed 's/\r$//' | bash
```

## 📡 5. MONITORING :

```bash
sudo systemctl status zgs
```

## 6. CHECK FULL LOGS :

```
tail -f ~/0g-storage-node/run/log/zgs.log.$(TZ=UTC date +%Y-%m-%d)
```

### 🔄 7.  CHECK SYNCKING :

```
 while true; do     response=$(curl -s -X POST http://localhost:5678 -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"zgs_getStatus","params":[],"id":1}');     logSyncHeight=$(echo $response | jq '.result.logSyncHeight');     connectedPeers=$(echo $response | jq '.result.connectedPeers');     echo -e "logSyncHeight: \033[32m$logSyncHeight\033[0m, connectedPeers: \033[34m$connectedPeers\033[0m";     sleep 5; done
```

## 💽 CHECK DISK SPACE :

```bash
df -h
```

## 🧹 REMOVE NODE (SPACE)
  
```
sudo systemctl stop zgs
```

```
sudo systemctl disable zgs
sudo rm /etc/systemd/system/zgs.service
rm -rf $HOME/0g-storage-node
```

### 🔹 Steps

1. **Cron service enable & start**

```bash
sudo apt update && sudo apt install cron -y
sudo systemctl enable cron
sudo systemctl start cron
```

2. **Crontab edit karo**

```bash
crontab -e
```

3. **Ye line add karo (aapke path ke hisaab se):**

```cron
0 3 * * * find /home/suchit48/0g-storage-node/run/log/ -type f -mtime +2 -exec rm {} \;
```

### 🔹 Verify Cron Jobs

```bash
crontab -l
```

## Process for Local Device & how to restart on next day :

* So, For local PC All the process is same as VPS: You have to start from [Pre-Requirements 🛠]
                  
- Just Open your wsl/terminal and run Next Day

```
sudo systemctl restart zgs
```

## 🌐 Useful Links

* **Explorer (Txs View)**:
  [https://chainscan-galileo.0g.ai/](https://chainscan-galileo.0g.ai/)

* **Miner Stats (Paste Wallet)**:
  [https://storagescan-galileo.0g.ai/miner/](https://storagescan-galileo.0g.ai/miner/)

## 📢 Community

👉 Join Telegram for Help & Updates:
[https://t.me/ntekearning2](https://t.me/ntekearning2)

🛠 Made with ❤️ by **NTEK**















