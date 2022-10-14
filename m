Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D153CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 02:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cROh27n6ZgnlgI33WYAJemy5DY2o8uvql7WSkJiRwzs=; b=hSimNK+NRLOFn/bN4yZW+VBErl
	MlfRJtZt4FrJHKplaoUZThGO0nLvRQfg3wW/DzJUPbltGjUZA3pmNbQr4mFPFG/cp0vUj80uu4AHC
	HzUnoN7tYE1eTIewaljpWkaYa9tk1YsCR9NtchIJibENdb8H9+kVXf1fy7jL41kKjdQxJVKM5dEci
	b4T5rtfZ5ucTLsVop6Nxm/BG4CXZFgdHSIxjSH9xio4+pkpfItdqk5pkcv/MJpYzCSwycItK6PIIx
	WB9D2wQU4R5bFp/+3IpxeLhL71JHD+noheMLQe4qJIkh4nJw1CAHCel3brKu9sqtBIiWIWM6SgSSe
	38eYGZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAuF-00DSyF-6Z; Fri, 14 Oct 2022 02:58:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAuA-00DSw7-QY
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 02:58:38 +0000
X-UUID: 07b4b177924045f68f628f291c86e931-20221013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cROh27n6ZgnlgI33WYAJemy5DY2o8uvql7WSkJiRwzs=;
	b=uOpS1LIPY1ACouhIGmu5zazpxgq2LvOv7RkrBUPZyNpCk3bSOpF1RtTwL5afQYvRCV3e3Nk8UefsDEuPMpGzzpOUevyTpdd3ioab1o5Arxel3P80uYQzE0BpZDEjzss8RdSkpY/QB07pMmFrUxG/PwJArlpNMirJvhvrLh/9ROc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:50c998f7-70c3-400a-8e38-f7ba16920432,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:f452e7e1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 07b4b177924045f68f628f291c86e931-20221013
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1613112219; Thu, 13 Oct 2022 19:58:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Oct 2022 10:57:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Oct 2022 10:57:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7915: improve accuracy of time_busy calculation
Date: Fri, 14 Oct 2022 10:57:47 +0800
Message-ID: <98348bffc688f4c1416981f72528eebcc01faee3.1665714480.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_195834_889475_7C2DB79B 
X-CRM114-Status: GOOD (  14.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MIB INFO command is fetching MIB_BUSY_TIME, MIB_TX_TIME, MIB_RX_TIME and
MIB_OBSS_AIRTIME from the radio and filling out cc_busy, cc_tx, cc_bss_rx
and cc_rx respectively.

busy should be >= tx + rx >= tx + bss_rx but we don’t always quite see this.
Sometimes tx + rx is a bit higher than busy due to inaccurate accounting,
so this patch recalculates numbers to make them more reasonable.

Reported-By: Kevin Schneider <kevin.schneider@adtran.com>
Tested-by: Kevin Schneider <kevin.schneider@adtran.com>
Tested-by: Chad Monroe <chad.monroe@smartrg.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 17 +++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 35 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  8 +++--
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 14 ++++++++
 4 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c43a8dd16fea..7173ed964519 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -444,6 +444,23 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 
 	/* mt7915: disable rx rate report by default due to hw issues */
 	mt76_clear(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN);
+
+	/* clear estimated value of EIFS for Rx duration & OBSS time */
+	mt76_wr(dev, MT_WF_RMAC_RSVD0(band), MT_WF_RMAC_RSVD0_EIFS_CLR);
+
+	/* clear backoff time for Rx duration  */
+	mt76_clear(dev, MT_WF_RMAC_MIB_AIRTIME1(band),
+		   MT_WF_RMAC_MIB_NONQOSD_BACKOFF);
+	mt76_clear(dev, MT_WF_RMAC_MIB_AIRTIME3(band),
+		   MT_WF_RMAC_MIB_QOS01_BACKOFF);
+	mt76_clear(dev, MT_WF_RMAC_MIB_AIRTIME4(band),
+		   MT_WF_RMAC_MIB_QOS23_BACKOFF);
+
+	/* clear backoff time and set software compensation for OBSS time */
+	mask = MT_WF_RMAC_MIB_OBSS_BACKOFF | MT_WF_RMAC_MIB_ED_OFFSET;
+	set = FIELD_PREP(MT_WF_RMAC_MIB_OBSS_BACKOFF, 0) |
+	      FIELD_PREP(MT_WF_RMAC_MIB_ED_OFFSET, 4);
+	mt76_rmw(dev, MT_WF_RMAC_MIB_AIRTIME0(band), mask, set);
 }
 
 static void mt7915_mac_init(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8d2ef4329bde..49761790948d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2944,25 +2944,36 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 {
 	/* strict order */
 	static const u32 offs[] = {
-		MIB_BUSY_TIME, MIB_TX_TIME, MIB_RX_TIME, MIB_OBSS_AIRTIME,
-		MIB_BUSY_TIME_V2, MIB_TX_TIME_V2, MIB_RX_TIME_V2,
+		MIB_NON_WIFI_TIME,
+		MIB_TX_TIME,
+		MIB_RX_TIME,
+		MIB_OBSS_AIRTIME,
+		MIB_TXOP_INIT_COUNT,
+		/* v2 */
+		MIB_NON_WIFI_TIME_V2,
+		MIB_TX_TIME_V2,
+		MIB_RX_TIME_V2,
 		MIB_OBSS_AIRTIME_V2
 	};
 	struct mt76_channel_state *state = phy->mt76->chan_state;
 	struct mt76_channel_state *state_ts = &phy->state_ts;
 	struct mt7915_dev *dev = phy->dev;
-	struct mt7915_mcu_mib *res, req[4];
+	struct mt7915_mcu_mib *res, req[5];
 	struct sk_buff *skb;
 	int i, ret, start = 0, ofs = 20;
+	u64 cc_tx;
 
 	if (!is_mt7915(&dev->mt76)) {
-		start = 4;
+		start = 5;
 		ofs = 0;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < 5; i++) {
 		req[i].band = cpu_to_le32(phy != &dev->phy);
 		req[i].offs = cpu_to_le32(offs[i + start]);
+
+		if (!is_mt7915(&dev->mt76) && i == 3)
+			break;
 	}
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO),
@@ -2972,20 +2983,24 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 
 	res = (struct mt7915_mcu_mib *)(skb->data + ofs);
 
+#define __res_u64(s) le64_to_cpu(res[s].data)
+	/* subtract Tx backoff time from Tx duration */
+	cc_tx = is_mt7915(&dev->mt76) ? __res_u64(1) - __res_u64(4) : __res_u64(1);
+
 	if (chan_switch)
 		goto out;
 
-#define __res_u64(s) le64_to_cpu(res[s].data)
-	state->cc_busy += __res_u64(0) - state_ts->cc_busy;
-	state->cc_tx += __res_u64(1) - state_ts->cc_tx;
+	state->cc_tx += cc_tx - state_ts->cc_tx;
 	state->cc_bss_rx += __res_u64(2) - state_ts->cc_bss_rx;
 	state->cc_rx += __res_u64(2) + __res_u64(3) - state_ts->cc_rx;
+	state->cc_busy += __res_u64(0) + cc_tx + __res_u64(2) + __res_u64(3) -
+			  state_ts->cc_busy;
 
 out:
-	state_ts->cc_busy = __res_u64(0);
-	state_ts->cc_tx = __res_u64(1);
+	state_ts->cc_tx = cc_tx;
 	state_ts->cc_bss_rx = __res_u64(2);
 	state_ts->cc_rx = __res_u64(2) + __res_u64(3);
+	state_ts->cc_busy = __res_u64(0) + cc_tx + __res_u64(2) + __res_u64(3);
 #undef __res_u64
 
 	dev_kfree_skb(skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 87cd1bfff3e6..a4f903f88078 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -160,15 +160,17 @@ struct mt7915_mcu_mib {
 
 enum mt7915_chan_mib_offs {
 	/* mt7915 */
-	MIB_BUSY_TIME = 14,
 	MIB_TX_TIME = 81,
 	MIB_RX_TIME,
 	MIB_OBSS_AIRTIME = 86,
+	MIB_NON_WIFI_TIME,
+	MIB_TXOP_INIT_COUNT,
+
 	/* mt7916 */
-	MIB_BUSY_TIME_V2 = 0,
 	MIB_TX_TIME_V2 = 6,
 	MIB_RX_TIME_V2 = 8,
-	MIB_OBSS_AIRTIME_V2 = 490
+	MIB_OBSS_AIRTIME_V2 = 490,
+	MIB_NON_WIFI_TIME_V2
 };
 
 struct edca {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 5180dd931835..7db809671230 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -525,8 +525,22 @@ enum offs_rev {
 #define MT_WF_RFCR1_DROP_CFEND		BIT(7)
 #define MT_WF_RFCR1_DROP_CFACK		BIT(8)
 
+#define MT_WF_RMAC_RSVD0(_band)	MT_WF_RMAC(_band, 0x02e0)
+#define MT_WF_RMAC_RSVD0_EIFS_CLR	BIT(21)
+
 #define MT_WF_RMAC_MIB_AIRTIME0(_band)	MT_WF_RMAC(_band, 0x0380)
 #define MT_WF_RMAC_MIB_RXTIME_CLR	BIT(31)
+#define MT_WF_RMAC_MIB_OBSS_BACKOFF	GENMASK(15, 0)
+#define MT_WF_RMAC_MIB_ED_OFFSET	GENMASK(20, 16)
+
+#define MT_WF_RMAC_MIB_AIRTIME1(_band)	MT_WF_RMAC(_band, 0x0384)
+#define MT_WF_RMAC_MIB_NONQOSD_BACKOFF	GENMASK(31, 16)
+
+#define MT_WF_RMAC_MIB_AIRTIME3(_band)	MT_WF_RMAC(_band, 0x038c)
+#define MT_WF_RMAC_MIB_QOS01_BACKOFF	GENMASK(31, 0)
+
+#define MT_WF_RMAC_MIB_AIRTIME4(_band)	MT_WF_RMAC(_band, 0x0390)
+#define MT_WF_RMAC_MIB_QOS23_BACKOFF	GENMASK(31, 0)
 
 /* WFDMA0 */
 #define MT_WFDMA0_BASE			__REG(WFDMA0_ADDR)
-- 
2.36.1


