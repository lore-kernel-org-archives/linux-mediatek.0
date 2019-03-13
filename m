From: <sean.wang@mediatek.com>
Subject: [PATCH] Bluetooth: mediatek: fix uninitialized symbol errors in btmtksdio_rx_packet
Date: Thu, 14 Mar 2019 04:43:49 +0800
Message-ID: <8fb8e6840a39127112597963d665fbe6c21d8b91.1552509647.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fixed all the below warnings. They would probably cause the following
error handling path would use the uninitialized value and then produce
unexpected behavior.

drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_len’ may be used
uninitialized in this function [-Wmaybe-uninitialized]
  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          old_data, old_len, true);
          ~~~~~~~~~~~~~~~~~~~~~~~~
drivers/bluetooth/btmtksdio.c:376:15: note: ‘old_len’ was declared here
  unsigned int old_len;
               ^~~~~~~
drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_data’ may be used
uninitialized in this function [-Wmaybe-uninitialized]
  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          old_data, old_len, true);
          ~~~~~~~~~~~~~~~~~~~~~~~~
drivers/bluetooth/btmtksdio.c:375:17: note: ‘old_data’ was declared here
  unsigned char *old_data;
                 ^~~~~~~~

Fixes: d74eef2834b5 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b4b8320f279e..23cf63888bac 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -372,8 +372,8 @@ static int btmtksdio_rx_packet(struct btmtksdio_dev *bdev, u16 rx_size)
 	const struct h4_recv_pkt *pkts = mtk_recv_pkts;
 	int pkts_count = ARRAY_SIZE(mtk_recv_pkts);
 	struct mtkbtsdio_hdr *sdio_hdr;
-	unsigned char *old_data;
-	unsigned int old_len;
+	unsigned char *old_data = NULL;
+	unsigned int old_len = 0;
 	int err, i, pad_size;
 	struct sk_buff *skb;
 	u16 dlen;
-- 
2.18.0
