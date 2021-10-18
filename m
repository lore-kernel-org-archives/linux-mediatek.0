Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4398C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE3360EE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BE3360EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=na8i0LOn5H96frUuWUzqydc+XNJuU1rrCYith2hxpSA=; b=sRYUUoaYiHqwuT
	1Bvlv0qePsim2csdgzpRyM2iuY03hwwQ8syALAoRd4n1RRIERKRweKqZjzITJK0EwuGhQz8nO3xYL
	6r5q2b2Sr1+cfCjoqPABiLeOXDEH5WlCsG6TBATRhQ1jxzV6028ULpZBZStkr99CYF3rBkOz+GOQ6
	hpI0U80lKVPHw0S2Xsf7fSwWmb+PwJRgx3KyAtTQtA/Jjjp6GsboklFniyZkVnL7kGgAOGxAuKw8k
	LXvguqDH6219YbfVA3n/EvrAHsNWZr05mJv6QlBlf2T/9wCL1whdMdclkQAHeeswmbq2Zv8T2Xzt9
	1ZAqGiv1MKqHUmaKNmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcbxV-00HRRy-49; Mon, 18 Oct 2021 23:22:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcbxQ-00HRPl-48
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 23:22:17 +0000
X-UUID: 3bec909c08ff402694bb9f414379aea9-20211018
X-UUID: 3bec909c08ff402694bb9f414379aea9-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 60889629; Mon, 18 Oct 2021 16:22:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 16:12:26 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 07:12:25 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v5 12/17] mt76: sdio: extend sdio module to support CONNAC2
Date: Tue, 19 Oct 2021 07:11:42 +0800
Message-ID: <a7b5624580b9145e95430ff31a324b8fb75ccae4.1634598341.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634598341.git.objelf@gmail.com>
References: <cover.1634598341.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_162216_200319_CB9F56DF 
X-CRM114-Status: GOOD (  18.04  )
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

Extend sdio module to support CONNAC2 hw that mt7921s rely on.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 +++-
 .../net/wireless/mediatek/mt76/mt7615/sdio.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/sdio.c     | 23 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/sdio.h     | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/sdio_txrx.c    |  7 +++++-
 5 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index a3fc0c920f46..85afe05d7f30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -506,6 +506,7 @@ struct mt76_sdio {
 
 	struct sdio_func *func;
 	void *intr_data;
+	u8 hw_ver;
 
 	struct {
 		int pse_data_quota;
@@ -1253,7 +1254,8 @@ int mt76s_alloc_tx(struct mt76_dev *dev);
 void mt76s_deinit(struct mt76_dev *dev);
 void mt76s_sdio_irq(struct sdio_func *func);
 void mt76s_txrx_worker(struct mt76_sdio *sdio);
-int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func);
+int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func,
+		  int hw_ver);
 u32 mt76s_rr(struct mt76_dev *dev, u32 offset);
 void mt76s_wr(struct mt76_dev *dev, u32 offset, u32 val);
 u32 mt76s_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 8d23dd4d5457..31c4a76b7f91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -120,7 +120,7 @@ static int mt7663s_probe(struct sdio_func *func,
 	if (ret < 0)
 		goto error;
 
-	ret = mt76s_hw_init(mdev, func);
+	ret = mt76s_hw_init(mdev, func, MT76_CONNAC_SDIO);
 	if (ret)
 		goto error;
 
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 7e613462b60e..c99acc21225e 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -221,11 +221,13 @@ int mt76s_rd_rp(struct mt76_dev *dev, u32 base,
 }
 EXPORT_SYMBOL_GPL(mt76s_rd_rp);
 
-int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func)
+int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func, int hw_ver)
 {
 	u32 status, ctrl;
 	int ret;
 
+	dev->sdio.hw_ver = hw_ver;
+
 	sdio_claim_host(func);
 
 	ret = sdio_enable_func(func);
@@ -255,12 +257,27 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func)
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
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.h b/drivers/net/wireless/mediatek/mt76/sdio.h
index dfcba5e3786c..99db4ad93b7c 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/sdio.h
@@ -21,7 +21,12 @@
 #define MCR_WHCR			0x000C
 #define W_INT_CLR_CTRL			BIT(1)
 #define RECV_MAILBOX_RD_CLR_EN		BIT(2)
+#define WF_SYS_RSTB			BIT(4) /* supported in CONNAC2 */
+#define WF_WHOLE_PATH_RSTB		BIT(5) /* supported in CONNAC2 */
+#define WF_SDIO_WF_PATH_RSTB		BIT(6) /* supported in CONNAC2 */
 #define MAX_HIF_RX_LEN_NUM		GENMASK(13, 8)
+#define MAX_HIF_RX_LEN_NUM_CONNAC2	GENMASK(14, 8) /* supported in CONNAC2 */
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
@@ -100,6 +106,23 @@
 
 #define MCR_SWPCDBGR			0x0154
 
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
 struct mt76s_intr {
 	u32 isr;
 	u32 *rec_mb;
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index f94de48ebadc..2728d45a2e61 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -112,8 +112,10 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 	for (i = 0; i < intr->rx.num[qid]; i++) {
 		int index = (q->head + i) % q->ndesc;
 		struct mt76_queue_entry *e = &q->entry[index];
+		__le32 *rxd = (__le32 *)buf;
 
-		len = intr->rx.len[qid][i];
+		/* parse rxd to get the actual packet length */
+		len = FIELD_GET(GENMASK(15, 0), le32_to_cpu(rxd[0]));
 		e->skb = mt76s_build_rx_skb(buf, len, round_up(len + 4, 4));
 		if (!e->skb)
 			break;
@@ -173,6 +175,9 @@ mt76s_tx_pick_quota(struct mt76_sdio *sdio, bool mcu, int buf_sz,
 
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
