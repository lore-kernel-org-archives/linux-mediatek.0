Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtmrZ+8YBojatQTR0VHO30M4c6UnrbZptdzEsBKOruA=; b=pcKZCphPB9owxq
	1cjdDLXWEg8YHTsOlFHhqusBqVA9cZ06Vds8BiKjYEj/9tSb0ZVkXxqX8LFZpoEeNJ5wSE5UFJP6X
	XNU+AH20hp+zP+U+8pJK0Sx9A6uY9CgzYfI4j66I58RhB1rlBn5xmoXGOv/KJQKY39mNpaJ0Q/qYa
	q8fAdRNyhYp0OidEBTkYfbMoZYQWBClUa/TDhjJowY5J9Z4LdvHqpwGLTAEoQ9hDdDYUO+N/W3RnU
	sXQv3UIDrS4k5W5bJwEbWsE1FPw7QS2hR5khDWtm3vpDuSB0fvRHEiXClW7A0q0URna8+IEmmYXSY
	Ne5mLGl+riLkjkuoP4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7vYf-0057mM-K7; Thu, 13 Jan 2022 08:34:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7vYT-0057l9-WA
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 08:33:59 +0000
X-UUID: 34ae28d74ac6448c8613cd5075ebb0fc-20220113
X-UUID: 34ae28d74ac6448c8613cd5075ebb0fc-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1823264539; Thu, 13 Jan 2022 01:33:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 00:23:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 13 Jan 2022 16:23:51 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Jan 2022 16:23:51 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Deren Wu" <deren.wu@mediatek.com>
Subject: [PATCH 2/3] mt76: sdio: honor the largest Tx buffer the hardware can
 support
Date: Thu, 13 Jan 2022 16:23:47 +0800
Message-ID: <557712deb9fc0e78d9a8dd7c68177fe2ae2a38ec.1642061035.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
References: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_003358_074304_ADA30207 
X-CRM114-Status: GOOD (  17.95  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

We should take it into account the actual the host and the device MMC
capability to determine what the appropriate xmit_buf_size can be.

Both MT7921S and MT7663 can support up to Tx FIFO size of 0x3fe00 which
means the device can receive 511 blocks of block size 512 in a row from
the host. So if the driver aggregates the frames as many as possible the
the device can support, we can merge multiple MMC requests into a single
one to get rid of the overhead of the handling and synchronizing in those
unnecessary MMC requests and reduce the SDIO lock contention with the
Bluetooth concurrent traffic and finally to have the higher bus
utilization with less idle cycle.

With the patch, it is helpful for WiFi to have steady throughput
performance especially while running Bluetooth concurrently.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c |  3 ++-
 drivers/net/wireless/mediatek/mt76/sdio.c        | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   |  2 +-
 5 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 4029a2217397..8703ecd6396f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -497,7 +497,7 @@ struct mt76_usb {
 	} mcu;
 };
 
-#define MT76S_XMIT_BUF_SZ	(16 * PAGE_SIZE)
+#define MT76S_XMIT_BUF_SZ	0x3fe00
 #define MT76S_NUM_TX_ENTRIES	256
 #define MT76S_NUM_RX_ENTRIES	512
 struct mt76_sdio {
@@ -508,6 +508,7 @@ struct mt76_sdio {
 	struct work_struct stat_work;
 
 	u8 *xmit_buf;
+	u32 xmit_buf_sz;
 
 	struct sdio_func *func;
 	void *intr_data;
@@ -1280,6 +1281,7 @@ void mt76u_queues_deinit(struct mt76_dev *dev);
 
 int mt76s_init(struct mt76_dev *dev, struct sdio_func *func,
 	       const struct mt76_bus_ops *bus_ops);
+u32 mt76s_get_xmit_buf_sz(struct mt76_dev *dev, u32 dev_xmit_sz);
 int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid);
 int mt76s_alloc_tx(struct mt76_dev *dev);
 void mt76s_deinit(struct mt76_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 554160b0ea9a..ed778b635391 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -140,7 +140,8 @@ static int mt7663s_probe(struct sdio_func *func,
 		goto error;
 	}
 
-	mdev->sdio.xmit_buf = devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
+	mdev->sdio.xmit_buf_sz = mt76s_get_xmit_buf_sz(mdev, MT76S_XMIT_BUF_SZ);
+	mdev->sdio.xmit_buf = devm_kmalloc(mdev->dev, mdev->sdio.xmit_buf_sz,
 					   GFP_KERNEL);
 	if (!mdev->sdio.xmit_buf) {
 		ret = -ENOMEM;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index c58c14e28430..6e5d9e9459ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -154,7 +154,8 @@ static int mt7921s_probe(struct sdio_func *func,
 		goto error;
 	}
 
-	mdev->sdio.xmit_buf = devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
+	mdev->sdio.xmit_buf_sz = mt76s_get_xmit_buf_sz(mdev, MT76S_XMIT_BUF_SZ);
+	mdev->sdio.xmit_buf = devm_kmalloc(mdev->dev, mdev->sdio.xmit_buf_sz,
 					   GFP_KERNEL);
 	if (!mdev->sdio.xmit_buf) {
 		ret = -ENOMEM;
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 54f72d215948..bd0027152026 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -12,6 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mmc/sdio_func.h>
+#include <linux/mmc/card.h>
+#include <linux/mmc/host.h>
 #include <linux/sched.h>
 #include <linux/kthread.h>
 
@@ -299,6 +301,17 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func, int hw_ver)
 }
 EXPORT_SYMBOL_GPL(mt76s_hw_init);
 
+u32 mt76s_get_xmit_buf_sz(struct mt76_dev *dev, u32 dev_max_len)
+{
+	struct sdio_func *func = dev->sdio.func;
+	u32 host_max_len = min_t(u32, func->card->host->max_req_size,
+				 func->cur_blksize *
+				 func->card->host->max_blk_count);
+
+	return min_t(u32, host_max_len, dev_max_len);
+}
+EXPORT_SYMBOL_GPL(mt76s_get_xmit_buf_sz);
+
 int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
 {
 	struct mt76_queue *q = &dev->q_rx[qid];
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index a04cd2444247..9fcf507e09bd 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -254,7 +254,7 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		}
 
 		pad = roundup(e->skb->len, 4) - e->skb->len;
-		if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
+		if (len + e->skb->len + pad + 4 > dev->sdio.xmit_buf_sz)
 			break;
 
 		if (mt76s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
