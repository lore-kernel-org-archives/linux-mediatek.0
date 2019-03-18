From: <sean.wang@mediatek.com>
Subject: [PATCH v2] Bluetooth: btmtksdio: fix uninitialized symbol errors in btmtksdio_rx_packet
Date: Tue, 19 Mar 2019 04:58:33 +0800
Message-ID: <741bf172b7d0b77e664e7edeab1bd798c955cc5b.1552942432.git.sean.wang@mediatek.com>
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

v2: Remove old_len and old_data because the error path for sdio_readsb also
    seems wrong. And change the prefix from "mediatek" to "btmtksdio".

Fixes: d74eef2834b5 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index befe43f9a34a..7d0d1cb93b0e 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -372,8 +372,6 @@ static int btmtksdio_rx_packet(struct btmtksdio_dev *bdev, u16 rx_size)
 	const struct h4_recv_pkt *pkts = mtk_recv_pkts;
 	int pkts_count = ARRAY_SIZE(mtk_recv_pkts);
 	struct mtkbtsdio_hdr *sdio_hdr;
-	unsigned char *old_data;
-	unsigned int old_len;
 	int err, i, pad_size;
 	struct sk_buff *skb;
 	u16 dlen;
@@ -392,12 +390,6 @@ static int btmtksdio_rx_packet(struct btmtksdio_dev *bdev, u16 rx_size)
 	if (err < 0)
 		goto err_kfree_skb;
 
-	/* Keep old data for dump the content in case of some error is
-	 * caught in the following packet parsing.
-	 */
-	old_data = skb->data;
-	old_len = skb->len;
-
 	bdev->hdev->stat.byte_rx += rx_size;
 
 	sdio_hdr = (void *)skb->data;
@@ -467,8 +459,6 @@ static int btmtksdio_rx_packet(struct btmtksdio_dev *bdev, u16 rx_size)
 	return 0;
 
 err_kfree_skb:
-	print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
-		       old_data, old_len, true);
 	kfree_skb(skb);
 
 	return err;
-- 
2.18.0
