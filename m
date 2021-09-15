Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:15:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E84760F23
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E84760F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mttQqM0DW+qwFsCe0pxrAk53BfeJdZt0JfUyCyKjw0=; b=fbQJ2NGntNhw9k
	KhmRoohmPSp9eOvIIvB1zRNgegCfNad4epwarEk645MXkI5nh/PsUcGgrmpZUexBWHFE1IH9KfFAa
	gKVWFaz9yigHGBBQWibFPMFAld9AWE41HN4sSuhB226uU2KBiMxsZAYpl2Ui2617/Jyb5HZ4MpnTr
	237dvfp+uwM2YdBHAdLy75YC36dgJyoBMO3RrLJ6SV0XLope5ySF8yCqUttFVFMxaGUKzm/eanhMN
	hY8vao1HnsWd4+ZjIBL1Q428cezu+Je38KDwLFGQsLhDtcE/rvorCiR1cb01OvTZQLQRRCjKoBH0L
	IJBZJbceulvGQVz0IDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJWZ-007mzl-N0; Wed, 15 Sep 2021 01:15:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJWV-007mxD-Q3
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 01:15:41 +0000
X-UUID: b6631003564642f19995ee48aa7a13d6-20210914
X-UUID: b6631003564642f19995ee48aa7a13d6-20210914
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1533946531; Tue, 14 Sep 2021 18:15:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 18:15:37 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Sep 2021 09:15:37 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <steve.lee@mediatek.com>, <jemele@google.com>,
 <shawnku@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v1 11/16] mt76: connac: extend mt76_connac_sdio module to
 support CONNAC2
Date: Wed, 15 Sep 2021 09:14:44 +0800
Message-ID: <3bf22843e9d62352fa311f601abb9b1869461d6d.1631667941.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1631667941.git.objelf@gmail.com>
References: <cover.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_181539_910437_AB4B1A0A 
X-CRM114-Status: GOOD (  21.82  )
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

From: Sean Wang <sean.wang@mediatek.com>

Extend mt76_connac_sdio module to support CONNAC2 hw that mt7921s rely on.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +
 .../net/wireless/mediatek/mt76/mt7615/sdio.c  |  3 +-
 .../wireless/mediatek/mt76/mt76_connac_sdio.c | 34 ++++++++--
 .../wireless/mediatek/mt76/mt76_connac_sdio.h | 52 ++++++++++++++-
 .../mediatek/mt76/mt76_connac_sdio_txrx.c     | 63 ++++++++++++++++---
 5 files changed, 137 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e76fb04de047..58fd0c7831f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -505,6 +505,8 @@ struct mt76_sdio {
 
 	struct sdio_func *func;
 	void *intr_data;
+	int intr_size;
+	u8 hw_ver;
 
 	struct {
 		int pse_data_quota;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 97660262b2de..4506c9ff319e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -113,7 +113,8 @@ static int mt7663s_probe(struct sdio_func *func,
 	if (ret < 0)
 		goto error;
 
-	ret = mt76_connac_sdio_hw_init(mdev, func, mt7663s_irq);
+	ret = mt76_connac_sdio_hw_init(mdev, func, MT76_CONNAC_SDIO,
+				       mt7663s_irq);
 	if (ret)
 		goto error;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
index d18a66e5445f..c11f044841dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.c
@@ -221,11 +221,13 @@ int mt76_connac_sdio_rd_rp(struct mt76_dev *dev, u32 base,
 EXPORT_SYMBOL_GPL(mt76_connac_sdio_rd_rp);
 
 int mt76_connac_sdio_hw_init(struct mt76_dev *dev, struct sdio_func *func,
-			     sdio_irq_handler_t *irq_handler)
+			     int hw_ver, sdio_irq_handler_t *irq_handler)
 {
 	u32 status, ctrl;
 	int ret;
 
+	dev->sdio.hw_ver = hw_ver;
+
 	sdio_claim_host(func);
 
 	ret = sdio_enable_func(func);
@@ -255,12 +257,27 @@ int mt76_connac_sdio_hw_init(struct mt76_dev *dev, struct sdio_func *func,
 		goto disable_func;
 
 	ctrl = WHIER_RX0_DONE_INT_EN | WHIER_TX_DONE_INT_EN;
+	if (hw_ver == MT76_CONNAC2_SDIO)
+		ctrl |= WHIER_RX1_DONE_INT_EN;
 	sdio_writel(func, ctrl, MCR_WHIER, &ret);
 	if (ret < 0)
 		goto disable_func;
 
-	/* set WHISR as read clear and Rx aggregation number as 16 */
-	ctrl = FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
+	switch (hw_ver) {
+	case MT76_CONNAC_SDIO:
+		/* set WHISR as read clear and Rx aggregation number as 16 */
+		ctrl = FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
+		break;
+	default:
+		ctrl = sdio_readl(func, MCR_WHCR, &ret);
+		if (ret < 0)
+			goto disable_func;
+		ctrl &= ~MAX_HIF_RX_LEN_NUM_CONNAC2;
+		ctrl &= ~W_INT_CLR_CTRL; /* read clear */
+		ctrl |= FIELD_PREP(MAX_HIF_RX_LEN_NUM_CONNAC2, 0);
+		break;
+	}
+
 	sdio_writel(func, ctrl, MCR_WHCR, &ret);
 	if (ret < 0)
 		goto disable_func;
@@ -287,8 +304,17 @@ int mt76_connac_sdio_init(struct mt76_dev *dev,
 {
 	int i, ret;
 
+	switch (dev->sdio.hw_ver) {
+	case MT76_CONNAC_SDIO:
+		dev->sdio.intr_size = sizeof(struct mt76_connac_sdio_intr);
+		break;
+	default:
+		dev->sdio.intr_size = sizeof(struct mt76_connac2_sdio_intr);
+		break;
+	}
+
 	dev->sdio.intr_data = devm_kmalloc(dev->dev,
-					   sizeof(struct mt76s_intr),
+					   dev->sdio.intr_size,
 					   GFP_KERNEL);
 	if (!dev->sdio.intr_data)
 		return -ENOMEM;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
index e176d6e562b2..a476e54361cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio.h
@@ -21,7 +21,12 @@
 #define MCR_WHCR			0x000C
 #define W_INT_CLR_CTRL			BIT(1)
 #define RECV_MAILBOX_RD_CLR_EN		BIT(2)
+#define WF_SYS_RSTB			BIT(4) /* supported in CONNAC2 */
+#define WF_WHOLE_PATH_RSTB		BIT(5) /* supported in CONNAC2 */
+#define WF_SDIO_WF_PATH_RSTB		BIT(6) /* supported in CONNAC2 */
 #define MAX_HIF_RX_LEN_NUM		GENMASK(13, 8)
+#define MAX_HIF_RX_LEN_NUM_CONNAC2		GENMASK(14, 8) /* supported in CONNAC2 */
+#define WF_RST_DONE			BIT(15) /* supported in CONNAC2 */
 #define RX_ENHANCE_MODE			BIT(16)
 
 #define MCR_WHISR			0x0010
@@ -29,6 +34,7 @@
 #define WHIER_D2H_SW_INT		GENMASK(31, 8)
 #define WHIER_FW_OWN_BACK_INT_EN	BIT(7)
 #define WHIER_ABNORMAL_INT_EN		BIT(6)
+#define WHIER_WDT_INT_EN		BIT(5) /* supported in CONNAC2 */
 #define WHIER_RX1_DONE_INT_EN		BIT(2)
 #define WHIER_RX0_DONE_INT_EN		BIT(1)
 #define WHIER_TX_DONE_INT_EN		BIT(0)
@@ -100,7 +106,37 @@
 
 #define MCR_SWPCDBGR			0x0154
 
-struct mt76s_intr {
+#define MCR_H2DSM2R			0x0160 /* supported in CONNAC2 */
+#define MCR_H2DSM3R			0x0164 /* supported in CONNAC2 */
+#define MCR_D2HRM3R			0x0174 /* supported in CONNAC2 */
+#define MCR_WTQCR8			0x0190 /* supported in CONNAC2 */
+#define MCR_WTQCR9			0x0194 /* supported in CONNAC2 */
+#define MCR_WTQCR10			0x0198 /* supported in CONNAC2 */
+#define MCR_WTQCR11			0x019C /* supported in CONNAC2 */
+#define MCR_WTQCR12			0x01A0 /* supported in CONNAC2 */
+#define MCR_WTQCR13			0x01A4 /* supported in CONNAC2 */
+#define MCR_WTQCR14			0x01A8 /* supported in CONNAC2 */
+#define MCR_WTQCR15			0x01AC /* supported in CONNAC2 */
+
+enum mt76_connac_sdio_ver {
+	MT76_CONNAC_SDIO,
+	MT76_CONNAC2_SDIO,
+};
+
+struct mt76_connac2_sdio_intr {
+	u32 isr;
+	struct {
+		u32 wtqcr[16];
+	} tx;
+	struct {
+		u16 num[2];
+		u16 len0[16];
+		u16 len1[128];
+	} rx;
+	u32 rec_mb[2];
+} __packed;
+
+struct mt76_connac_sdio_intr {
 	u32 isr;
 	struct {
 		u32 wtqcr[8];
@@ -112,6 +148,18 @@ struct mt76s_intr {
 	u32 rec_mb[2];
 } __packed;
 
+struct mt76s_intr {
+	u32 isr;
+	struct {
+		u32 *wtqcr;
+	} tx;
+	struct {
+		u16 num[2];
+		u16 *len[2];
+	} rx;
+	u32 rec_mb[2];
+};
+
 u32 mt76_connac_sdio_read_pcr(struct mt76_dev *dev);
 u32 mt76_connac_sdio_read_mailbox(struct mt76_dev *dev, u32 offset);
 void mt76_connac_sdio_write_mailbox(struct mt76_dev *dev, u32 offset, u32 val);
@@ -131,7 +179,7 @@ int mt76_connac_sdio_rd_rp(struct mt76_dev *dev, u32 base,
 
 void mt76_connac_sdio_txrx(struct mt76_dev *dev);
 int mt76_connac_sdio_hw_init(struct mt76_dev *dev, struct sdio_func *func,
-			     sdio_irq_handler_t *irq_handler);
+			     int hw_ver, sdio_irq_handler_t *irq_handler);
 int mt76_connac_sdio_init(struct mt76_dev *dev,
 			  void (*txrx_worker)(struct mt76_worker *));
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c
index 3ef42f90f3f5..c6a9d8fb4295 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_sdio_txrx.c
@@ -81,7 +81,7 @@ static int mt76_connac_sdio_rx_run_queue(struct mt76_dev *dev,
 					 enum mt76_rxq_id qid,
 					 struct mt76s_intr *intr)
 {
-	struct mt76_queue *q = &dev->q_rx[qid];
+	struct mt76_queue *q = &dev->q_rx[0];
 	struct mt76_sdio *sdio = &dev->sdio;
 	int len = 0, err, i;
 	struct page *page;
@@ -112,8 +112,10 @@ static int mt76_connac_sdio_rx_run_queue(struct mt76_dev *dev,
 	for (i = 0; i < intr->rx.num[qid]; i++) {
 		int index = (q->head + i) % q->ndesc;
 		struct mt76_queue_entry *e = &q->entry[index];
+		__le32 *rxd = (__le32 *)buf;
 
-		len = intr->rx.len[qid][i];
+		/* parse rxd to get the actual packet length */
+		len = FIELD_GET(GENMASK(15, 0), le32_to_cpu(rxd[0]));
 		e->skb = mt76_connac_sdio_build_rx_skb(buf, len,
 						       round_up(len + 4, 4));
 		if (!e->skb)
@@ -133,35 +135,73 @@ static int mt76_connac_sdio_rx_run_queue(struct mt76_dev *dev,
 	return i;
 }
 
+static void mt76_connac_sdio_intr_parse(struct mt76_dev *dev,
+					void *data,
+					struct mt76s_intr *intr)
+{
+	struct mt76_connac_sdio_intr *intr_v1;
+	struct mt76_connac2_sdio_intr *intr_v2;
+	int i;
+
+	switch (dev->sdio.hw_ver) {
+	case MT76_CONNAC_SDIO:
+		intr_v1 = data;
+		intr->isr =  intr_v1->isr;
+		intr->tx.wtqcr = intr_v1->tx.wtqcr;
+		for (i = 0; i < 2 ; i++) {
+			intr->rx.num[i] = intr_v1->rx.num[i];
+			intr->rx.len[i] = intr_v1->rx.len[i];
+			intr->rec_mb[i] = intr_v1->rec_mb[i];
+		}
+		break;
+	default:
+		intr_v2 = data;
+		intr->isr =  intr_v2->isr;
+		intr->tx.wtqcr = intr_v2->tx.wtqcr;
+		for (i = 0; i < 2 ; i++) {
+			intr->rx.num[i] = intr_v2->rx.num[i];
+			if (!i)
+				intr->rx.len[0] = intr_v2->rx.len0;
+			else
+				intr->rx.len[1] = intr_v2->rx.len1;
+			intr->rec_mb[i] = intr_v2->rec_mb[i];
+		}
+		break;
+	}
+}
+
 static int mt76_connac_sdio_rx_handler(struct mt76_dev *dev)
 {
 	struct mt76_sdio *sdio = &dev->sdio;
-	struct mt76s_intr *intr = sdio->intr_data;
+	void *data = sdio->intr_data;
+	struct mt76s_intr intr;
 	int nframes = 0, ret;
 
-	ret = sdio_readsb(sdio->func, intr, MCR_WHISR, sizeof(*intr));
+	ret = sdio_readsb(sdio->func, data, MCR_WHISR, sdio->intr_size);
 	if (ret < 0)
 		return ret;
 
-	trace_dev_irq(dev, intr->isr, 0);
+	mt76_connac_sdio_intr_parse(dev, data, &intr);
 
-	if (intr->isr & WHIER_RX0_DONE_INT_EN) {
-		ret = mt76_connac_sdio_rx_run_queue(dev, 0, intr);
+	trace_dev_irq(dev, intr.isr, 0);
+
+	if (intr.isr & WHIER_RX0_DONE_INT_EN) {
+		ret = mt76_connac_sdio_rx_run_queue(dev, 0, &intr);
 		if (ret > 0) {
 			mt76_worker_schedule(&sdio->net_worker);
 			nframes += ret;
 		}
 	}
 
-	if (intr->isr & WHIER_RX1_DONE_INT_EN) {
-		ret = mt76_connac_sdio_rx_run_queue(dev, 1, intr);
+	if (intr.isr & WHIER_RX1_DONE_INT_EN) {
+		ret = mt76_connac_sdio_rx_run_queue(dev, 1, &intr);
 		if (ret > 0) {
 			mt76_worker_schedule(&sdio->net_worker);
 			nframes += ret;
 		}
 	}
 
-	nframes += !!mt76_connac_sdio_refill_sched_quota(dev, intr->tx.wtqcr);
+	nframes += !!mt76_connac_sdio_refill_sched_quota(dev, intr.tx.wtqcr);
 
 	return nframes;
 }
@@ -174,6 +214,9 @@ static int mt76_connac_sdio_tx_pick_quota(struct mt76_sdio *sdio, bool mcu,
 
 	pse_sz = DIV_ROUND_UP(buf_sz + sdio->sched.deficit, MT_PSE_PAGE_SZ);
 
+	if (mcu && sdio->hw_ver == MT76_CONNAC2_SDIO)
+		pse_sz = 1;
+
 	if (mcu) {
 		if (sdio->sched.pse_mcu_quota < *pse_size + pse_sz)
 			return -EBUSY;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
