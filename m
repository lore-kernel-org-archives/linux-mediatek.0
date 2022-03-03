Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRrMI3x7D0JZdZB3mWteV1lzRO5AvdpZhr6EOop2Q3Y=; b=362yW0/LfIErHE
	oVmAstG916j3JQeW9bl5fspMYLG8qOp7jPgK63FLDHIWFg9Q7FhRCnP354AgrKJddwEIItXeilSMh
	NFsyJyOwPfpBHrwBG5xwPThS4j1D5djYAYlXlGpkbzA9uH7Ho+RkDQd1hyYUx1hJynUuCspdDeaAB
	i6fjliRTvEB42xoahKIKBksXmfz9eND/91b4j3xWX4MzaxNQXSxS0B73EUy5OOC9knShDKqwGFzFk
	KaxCyydO0wAPe6I73YpqogLFshpnGU3Ruftrtjxz2oA99SArJNns8iTyn4LM6Jj12IZCxDQNRrOCX
	de2CRT4Mh1oT1PTRdaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjSD-006BUa-0k; Thu, 03 Mar 2022 11:17:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPjS9-006BTm-Cd
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 11:17:03 +0000
X-UUID: b1ca40b5150145b09d1b8d8e65610bb3-20220303
X-UUID: b1ca40b5150145b09d1b8d8e65610bb3-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020751878; Thu, 03 Mar 2022 04:16:56 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 03:07:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 19:06:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Mar 2022 19:06:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/3] mt76: mt7915: fix beamforming mib stats
Date: Thu, 3 Mar 2022 19:05:34 +0800
Message-ID: <20220303110535.30640-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220303110535.30640-1-shayne.chen@mediatek.com>
References: <20220303110535.30640-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_031701_462513_65219DDA 
X-CRM114-Status: GOOD (  12.33  )
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

Some of beamforming mib counters are moved to different offsets
or registers in newer chipsets.

Fixes: 99ad32a4ca3a ("mt76: mt7915: add support for MT7986")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 73 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 28 +++++--
 3 files changed, 69 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index aecf7eb..2fc884c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2189,15 +2189,6 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	cnt = mt76_rr(dev, MT_MIB_SDR31(phy->band_idx));
 	mib->rx_ba_cnt += cnt;
 
-	cnt = mt76_rr(dev, MT_MIB_SDR32(phy->band_idx));
-	mib->tx_pkt_ebf_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK, cnt);
-
-	if (is_mt7915(&dev->mt76))
-		cnt = mt76_rr(dev, MT_MIB_SDR33(phy->band_idx));
-	mib->tx_pkt_ibf_cnt += is_mt7915(&dev->mt76) ?
-		       FIELD_GET(MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK, cnt) :
-		       FIELD_GET(MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK_MT7916, cnt);
-
 	cnt = mt76_rr(dev, MT_MIB_SDRMUBF(phy->band_idx));
 	mib->tx_bf_cnt += FIELD_GET(MT_MIB_MU_BF_TX_CNT, cnt);
 
@@ -2210,24 +2201,10 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	cnt = mt76_rr(dev, MT_MIB_DR11(phy->band_idx));
 	mib->tx_su_acked_mpdu_cnt += cnt;
 
-	cnt = mt76_rr(dev, MT_ETBF_TX_APP_CNT(phy->band_idx));
-	mib->tx_bf_ibf_ppdu_cnt += FIELD_GET(MT_ETBF_TX_IBF_CNT, cnt);
-	mib->tx_bf_ebf_ppdu_cnt += FIELD_GET(MT_ETBF_TX_EBF_CNT, cnt);
-
-	cnt = mt76_rr(dev, MT_ETBF_RX_FB_CNT(phy->band_idx));
-	mib->tx_bf_rx_fb_all_cnt += FIELD_GET(MT_ETBF_RX_FB_ALL, cnt);
-	mib->tx_bf_rx_fb_he_cnt += FIELD_GET(MT_ETBF_RX_FB_HE, cnt);
-	mib->tx_bf_rx_fb_vht_cnt += FIELD_GET(MT_ETBF_RX_FB_VHT, cnt);
-	mib->tx_bf_rx_fb_ht_cnt += FIELD_GET(MT_ETBF_RX_FB_HT, cnt);
-
-	cnt = mt76_rr(dev, MT_ETBF_RX_FB_CONT(phy->band_idx));
-	mib->tx_bf_rx_fb_bw = FIELD_GET(MT_ETBF_RX_FB_BW, cnt);
-	mib->tx_bf_rx_fb_nc_cnt += FIELD_GET(MT_ETBF_RX_FB_NC, cnt);
-	mib->tx_bf_rx_fb_nr_cnt += FIELD_GET(MT_ETBF_RX_FB_NR, cnt);
-
-	cnt = mt76_rr(dev, MT_ETBF_TX_NDP_BFRP(phy->band_idx));
-	mib->tx_bf_fb_cpl_cnt += FIELD_GET(MT_ETBF_TX_FB_CPL, cnt);
-	mib->tx_bf_fb_trig_cnt += FIELD_GET(MT_ETBF_TX_FB_TRI, cnt);
+	cnt = mt76_rr(dev, MT_ETBF_PAR_RPT0(phy->band_idx));
+	mib->tx_bf_rx_fb_bw += FIELD_GET(MT_ETBF_PAR_RPT0_FB_BW, cnt);
+	mib->tx_bf_rx_fb_nc_cnt += FIELD_GET(MT_ETBF_PAR_RPT0_FB_NC, cnt);
+	mib->tx_bf_rx_fb_nr_cnt += FIELD_GET(MT_ETBF_PAR_RPT0_FB_NR, cnt);
 
 	for (i = 0; i < ARRAY_SIZE(mib->tx_amsdu); i++) {
 		cnt = mt76_rr(dev, MT_PLE_AMSDU_PACK_MSDU_CNT(i));
@@ -2256,6 +2233,26 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 			dev->mt76.aggr_stats[aggr1++] += val & 0xffff;
 			dev->mt76.aggr_stats[aggr1++] += val >> 16;
 		}
+
+		cnt = mt76_rr(dev, MT_MIB_SDR32(phy->band_idx));
+		mib->tx_pkt_ebf_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT, cnt);
+
+		cnt = mt76_rr(dev, MT_MIB_SDR33(phy->band_idx));
+		mib->tx_pkt_ibf_cnt += FIELD_GET(MT_MIB_SDR33_TX_PKT_IBF_CNT, cnt);
+
+		cnt = mt76_rr(dev, MT_ETBF_TX_APP_CNT(phy->band_idx));
+		mib->tx_bf_ibf_ppdu_cnt += FIELD_GET(MT_ETBF_TX_IBF_CNT, cnt);
+		mib->tx_bf_ebf_ppdu_cnt += FIELD_GET(MT_ETBF_TX_EBF_CNT, cnt);
+
+		cnt = mt76_rr(dev, MT_ETBF_TX_NDP_BFRP(phy->band_idx));
+		mib->tx_bf_fb_cpl_cnt += FIELD_GET(MT_ETBF_TX_FB_CPL, cnt);
+		mib->tx_bf_fb_trig_cnt += FIELD_GET(MT_ETBF_TX_FB_TRI, cnt);
+
+		cnt = mt76_rr(dev, MT_ETBF_RX_FB_CNT(phy->band_idx));
+		mib->tx_bf_rx_fb_all_cnt += FIELD_GET(MT_ETBF_RX_FB_ALL, cnt);
+		mib->tx_bf_rx_fb_he_cnt += FIELD_GET(MT_ETBF_RX_FB_HE, cnt);
+		mib->tx_bf_rx_fb_vht_cnt += FIELD_GET(MT_ETBF_RX_FB_VHT, cnt);
+		mib->tx_bf_rx_fb_ht_cnt += FIELD_GET(MT_ETBF_RX_FB_HT, cnt);
 	} else {
 		for (i = 0; i < 2; i++) {
 			/* rts count */
@@ -2284,6 +2281,28 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 			dev->mt76.aggr_stats[aggr0++] += FIELD_GET(GENMASK(15, 0), val);
 			dev->mt76.aggr_stats[aggr0++] += FIELD_GET(GENMASK(31, 16), val);
 		}
+
+		cnt = mt76_rr(dev, MT_MIB_SDR32(phy->band_idx));
+		mib->tx_pkt_ibf_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_IBF_CNT, cnt);
+		mib->tx_bf_ibf_ppdu_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_IBF_CNT, cnt);
+		mib->tx_pkt_ebf_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT, cnt);
+		mib->tx_bf_ebf_ppdu_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT, cnt);
+
+		cnt = mt76_rr(dev, MT_MIB_BFCR7(phy->band_idx));
+		mib->tx_bf_fb_cpl_cnt += FIELD_GET(MT_MIB_BFCR7_BFEE_TX_FB_CPL, cnt);
+
+		cnt = mt76_rr(dev, MT_MIB_BFCR2(phy->band_idx));
+		mib->tx_bf_fb_trig_cnt += FIELD_GET(MT_MIB_BFCR2_BFEE_TX_FB_TRIG, cnt);
+
+		cnt = mt76_rr(dev, MT_MIB_BFCR0(phy->band_idx));
+		mib->tx_bf_rx_fb_vht_cnt += FIELD_GET(MT_MIB_BFCR0_RX_FB_VHT, cnt);
+		mib->tx_bf_rx_fb_all_cnt += FIELD_GET(MT_MIB_BFCR0_RX_FB_VHT, cnt);
+		mib->tx_bf_rx_fb_ht_cnt += FIELD_GET(MT_MIB_BFCR0_RX_FB_HT, cnt);
+		mib->tx_bf_rx_fb_all_cnt += FIELD_GET(MT_MIB_BFCR0_RX_FB_HT, cnt);
+
+		cnt = mt76_rr(dev, MT_MIB_BFCR1(phy->band_idx));
+		mib->tx_bf_rx_fb_he_cnt += FIELD_GET(MT_MIB_BFCR1_RX_FB_HE, cnt);
+		mib->tx_bf_rx_fb_all_cnt += FIELD_GET(MT_MIB_BFCR1_RX_FB_HE, cnt);
 	}
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 1b14bba..5062e0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -122,6 +122,7 @@ static const u32 mt7915_offs[] = {
 	[PLE_PG_HIF_GROUP]	= 0x110,
 	[PLE_HIF_PG_INFO]	= 0x114,
 	[AC_OFFSET]		= 0x040,
+	[ETBF_PAR_RPT0]		= 0x068,
 };
 
 static const u32 mt7916_offs[] = {
@@ -194,6 +195,7 @@ static const u32 mt7916_offs[] = {
 	[PLE_PG_HIF_GROUP]	= 0x00c,
 	[PLE_HIF_PG_INFO]	= 0x388,
 	[AC_OFFSET]		= 0x080,
+	[ETBF_PAR_RPT0]		= 0x100,
 };
 
 static const struct __map mt7915_reg_map[] = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 8fe24ab..e5f93c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -103,6 +103,7 @@ enum offs_rev {
 	PLE_PG_HIF_GROUP,
 	PLE_HIF_PG_INFO,
 	AC_OFFSET,
+	ETBF_PAR_RPT0,
 	__MT_OFFS_MAX,
 };
 
@@ -223,10 +224,10 @@ enum offs_rev {
 #define MT_ETBF_TX_FB_CPL		GENMASK(31, 16)
 #define MT_ETBF_TX_FB_TRI		GENMASK(15, 0)
 
-#define MT_ETBF_RX_FB_CONT(_band)	MT_WF_ETBF(_band, 0x068)
-#define MT_ETBF_RX_FB_BW		GENMASK(7, 6)
-#define MT_ETBF_RX_FB_NC		GENMASK(5, 3)
-#define MT_ETBF_RX_FB_NR		GENMASK(2, 0)
+#define MT_ETBF_PAR_RPT0(_band)		MT_WF_ETBF(_band, __OFFS(ETBF_PAR_RPT0))
+#define MT_ETBF_PAR_RPT0_FB_BW		GENMASK(7, 6)
+#define MT_ETBF_PAR_RPT0_FB_NC		GENMASK(5, 3)
+#define MT_ETBF_PAR_RPT0_FB_NR		GENMASK(2, 0)
 
 #define MT_ETBF_TX_APP_CNT(_band)	MT_WF_ETBF(_band, 0x0f0)
 #define MT_ETBF_TX_IBF_CNT		GENMASK(31, 16)
@@ -367,11 +368,11 @@ enum offs_rev {
 #define MT_MIB_SDR31(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR31))
 
 #define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR32))
-#define MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK	GENMASK(15, 0)
+#define MT_MIB_SDR32_TX_PKT_EBF_CNT	GENMASK(15, 0)
+#define MT_MIB_SDR32_TX_PKT_IBF_CNT	GENMASK(31, 16)
 
 #define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x088)
-#define MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK	GENMASK(15, 0)
-#define MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK_MT7916	GENMASK(31, 16)
+#define MT_MIB_SDR33_TX_PKT_IBF_CNT	GENMASK(15, 0)
 
 #define MT_MIB_SDRMUBF(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDRMUBF))
 #define MT_MIB_MU_BF_TX_CNT		GENMASK(15, 0)
@@ -401,6 +402,19 @@ enum offs_rev {
 						  ((n) << 2))
 #define MT_MIB_ARNCR_RANGE(val, n)	(((val) >> ((n) << 3)) & GENMASK(7, 0))
 
+#define MT_MIB_BFCR0(_band)		MT_WF_MIB(_band, 0x7b0)
+#define MT_MIB_BFCR0_RX_FB_HT		GENMASK(15, 0)
+#define MT_MIB_BFCR0_RX_FB_VHT		GENMASK(31, 16)
+
+#define MT_MIB_BFCR1(_band)		MT_WF_MIB(_band, 0x7b4)
+#define MT_MIB_BFCR1_RX_FB_HE		GENMASK(15, 0)
+
+#define MT_MIB_BFCR2(_band)		MT_WF_MIB(_band, 0x7b8)
+#define MT_MIB_BFCR2_BFEE_TX_FB_TRIG	GENMASK(15, 0)
+
+#define MT_MIB_BFCR7(_band)		MT_WF_MIB(_band, 0x7cc)
+#define MT_MIB_BFCR7_BFEE_TX_FB_CPL	GENMASK(15, 0)
+
 /* WTBLON TOP */
 #define MT_WTBLON_TOP_BASE		0x820d4000
 #define MT_WTBLON_TOP(ofs)		(MT_WTBLON_TOP_BASE + (ofs))
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
