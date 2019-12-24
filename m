Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CE5C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 01:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD552075B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 01:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0qtF9hE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pi06ryVw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD552075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZOf9fLBdBnTR3VZSpYeYpExGIMwPiLSRkIf3B76znA=; b=u0qtF9hE2MHqaT
	+cJE96CSY0TuQJfpAK+CVHXTifHGr4A2RCtGnm6Tw90m1+ZAacjCb9zeyWiFb4DMNtJpNCmhsll/c
	LODi9MMXVr4cibH2rqagJxA31EW6RXq0AZJ7KKIEB/YMQAoqVc3l01gTc6VGd7OfrOcgcTV8VQDrz
	Dr8rT1a2fdCnEyGFpai3d/0i2+eTsVpjAVwW+ALC/Vrmer6ApOI7FoB3x9hPRapQcGPzs+Oz9iHSt
	XgwNig2F9o6ZM4RHYvuAqttrk7OKl8uhwH7HyQFtIvI+dP3HYl3TQUD58l+LgbdVKbeiD1dvOAf+a
	htQZ7TM6jwdQ2G1TRrTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijYwS-0005KW-7v; Tue, 24 Dec 2019 01:24:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijYwP-0005Jm-5d
 for linux-mediatek@lists.infradead.org; Tue, 24 Dec 2019 01:24:55 +0000
X-UUID: 271f33e50dc84e38a34e6a89a499c156-20191223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=q/7MmQNuPr5JrCrqcpEI/Kr7uFLHIWbzpfZhgQRMDyU=; 
 b=Pi06ryVwr5uY7JcruUpnceO1qs7kWS1eAhVsKnm1EpkNZehTCGajx2tOjcWRLWXi5pS+Hb28FvtnG214PL8x8zIrKcmgIsjkkq456XG2Z2CaXB+lQu4L4bn4inTGKN8/9M9p9pXqdmduQW0nTqU8To7QKpmxMtkagPD0QEuof2s=;
X-UUID: 271f33e50dc84e38a34e6a89a499c156-20191223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 356824895; Mon, 23 Dec 2019 17:24:44 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 17:25:06 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 09:24:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 24 Dec 2019 09:24:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: add missing settings for simultaneous dual-band
 support
Date: Tue, 24 Dec 2019 09:24:25 +0800
Message-ID: <2d9c7c4dff5149f563ac5688e4ac4a911fbda3f7.1577149810.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_172453_226108_6FED19B6 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7615 supports dual-wiphy which means that it can run on 2.4G and 5GHz
channels simultaneously, and driver should configure each band.

Add missing register settings, and refine band related definitions to
avoid duplicate codes.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 52 +++++++-------
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 71 +++++++------------
 .../net/wireless/mediatek/mt76/mt7615/regs.h  | 52 +++++---------
 3 files changed, 69 insertions(+), 106 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 94a0dc8bfa28..589e933e00d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -28,17 +28,17 @@ static void mt7615_mac_init(struct mt7615_dev *dev)
 		 MT_CFG_CCR_MAC_D0_1X_GC_EN | MT_CFG_CCR_MAC_D0_2X_GC_EN |
 		 MT_CFG_CCR_MAC_D1_1X_GC_EN | MT_CFG_CCR_MAC_D1_2X_GC_EN);
 
-	val = mt76_rmw(dev, MT_TMAC_TRCR0,
+	val = mt76_rmw(dev, MT_TMAC_TRCR(0),
 		       MT_TMAC_TRCR_CCA_SEL | MT_TMAC_TRCR_SEC_CCA_SEL,
 		       FIELD_PREP(MT_TMAC_TRCR_CCA_SEL, 2) |
 		       FIELD_PREP(MT_TMAC_TRCR_SEC_CCA_SEL, 0));
-	mt76_wr(dev, MT_TMAC_TRCR1, val);
+	mt76_wr(dev, MT_TMAC_TRCR(1), val);
 
 	val = MT_AGG_ACR_PKT_TIME_EN | MT_AGG_ACR_NO_BA_AR_RULE |
 	      FIELD_PREP(MT_AGG_ACR_CFEND_RATE, MT7615_CFEND_RATE_DEFAULT) |
 	      FIELD_PREP(MT_AGG_ACR_BAR_RATE, MT7615_BAR_RATE_DEFAULT);
-	mt76_wr(dev, MT_AGG_ACR0, val);
-	mt76_wr(dev, MT_AGG_ACR1, val);
+	mt76_wr(dev, MT_AGG_ACR(0), val);
+	mt76_wr(dev, MT_AGG_ACR(1), val);
 
 	mt76_rmw_field(dev, MT_TMAC_CTCR0,
 		       MT_TMAC_CTCR0_INS_DDLMT_REFTIME, 0x3f);
@@ -59,25 +59,27 @@ static void mt7615_mac_init(struct mt7615_dev *dev)
 	mt76_wr(dev, MT_DMA_DCR0, MT_DMA_DCR0_RX_VEC_DROP |
 		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072));
 
-	mt76_wr(dev, MT_AGG_ARUCR,
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), 7) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), 2) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), 2) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), 2) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), 1));
-
-	mt76_wr(dev, MT_AGG_ARDCR,
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
-		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1));
+	val = FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), 7) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), 2) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), 2) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), 2) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), 1);
+	mt76_wr(dev, MT_AGG_ARUCR(0), val);
+	mt76_wr(dev, MT_AGG_ARUCR(1), val);
+
+	val = FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
+	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1);
+	mt76_wr(dev, MT_AGG_ARDCR(0), val);
+	mt76_wr(dev, MT_AGG_ARDCR(1), val);
 
 	mt76_wr(dev, MT_AGG_ARCR,
 		(FIELD_PREP(MT_AGG_ARCR_RTS_RATE_THR, 2) |
@@ -93,8 +95,8 @@ static void mt7615_mac_init(struct mt7615_dev *dev)
 	       MT_DMA_RCFR0_RX_DROPPED_MCAST;
 	set = FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_UCAST, 2) |
 	      FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_MCAST, 2);
-	mt76_rmw(dev, MT_DMA_BN0RCFR0, mask, set);
-	mt76_rmw(dev, MT_DMA_BN1RCFR0, mask, set);
+	mt76_rmw(dev, MT_DMA_RCFR0(0), mask, set);
+	mt76_rmw(dev, MT_DMA_RCFR0(1), mask, set);
 
 	for (i = 0; i < MT7615_WTBL_SIZE; i++)
 		mt7615_mac_wtbl_update(dev, i,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 903b8395a446..2a39f95f5e9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -69,7 +69,7 @@ void mt7615_mac_set_timing(struct mt7615_phy *phy)
 	s16 coverage_class = phy->coverage_class;
 	struct mt7615_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
-	u32 val, reg_offset, reg = ext_phy ? MT_TMAC_ICR1 : MT_TMAC_ICR0;
+	u32 val, reg_offset;
 	u32 cck = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 231) |
 		  FIELD_PREP(MT_TIMEOUT_VAL_CCA, 48);
 	u32 ofdm = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 60) |
@@ -103,7 +103,7 @@ void mt7615_mac_set_timing(struct mt7615_phy *phy)
 	mt76_wr(dev, MT_TMAC_CDTR, cck + reg_offset);
 	mt76_wr(dev, MT_TMAC_ODTR, ofdm + reg_offset);
 
-	mt76_wr(dev, reg,
+	mt76_wr(dev, MT_TMAC_ICR(ext_phy),
 		FIELD_PREP(MT_IFS_EIFS, 360) |
 		FIELD_PREP(MT_IFS_RIFS, 2) |
 		FIELD_PREP(MT_IFS_SIFS, sifs) |
@@ -114,15 +114,14 @@ void mt7615_mac_set_timing(struct mt7615_phy *phy)
 	else
 		val = MT7615_CFEND_RATE_11B;
 
-	if (ext_phy) {
-		mt76_rmw_field(dev, MT_AGG_ACR1, MT_AGG_ACR_CFEND_RATE, val);
+	mt76_rmw_field(dev, MT_AGG_ACR(ext_phy), MT_AGG_ACR_CFEND_RATE, val);
+	if (ext_phy)
 		mt76_clear(dev, MT_ARB_SCR,
 			   MT_ARB_SCR_TX1_DISABLE | MT_ARB_SCR_RX1_DISABLE);
-	} else {
-		mt76_rmw_field(dev, MT_AGG_ACR0, MT_AGG_ACR_CFEND_RATE, val);
+	else
 		mt76_clear(dev, MT_ARB_SCR,
 			   MT_ARB_SCR_TX0_DISABLE | MT_ARB_SCR_RX0_DISABLE);
-	}
+
 }
 
 int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
@@ -1322,21 +1321,12 @@ mt7615_mac_set_default_sensitivity(struct mt7615_phy *phy)
 	struct mt7615_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
 
-	if (!ext_phy) {
-		mt76_rmw(dev, MT_WF_PHY_B0_MIN_PRI_PWR,
-			 MT_WF_PHY_B0_PD_OFDM_MASK,
-			 MT_WF_PHY_B0_PD_OFDM(0x13c));
-		mt76_rmw(dev, MT_WF_PHY_B0_RXTD_CCK_PD,
-			 MT_WF_PHY_B0_PD_CCK_MASK,
-			 MT_WF_PHY_B0_PD_CCK(0x92));
-	} else {
-		mt76_rmw(dev, MT_WF_PHY_B1_MIN_PRI_PWR,
-			 MT_WF_PHY_B1_PD_OFDM_MASK,
-			 MT_WF_PHY_B1_PD_OFDM(0x13c));
-		mt76_rmw(dev, MT_WF_PHY_B1_RXTD_CCK_PD,
-			 MT_WF_PHY_B1_PD_CCK_MASK,
-			 MT_WF_PHY_B1_PD_CCK(0x92));
-	}
+	mt76_rmw(dev, MT_WF_PHY_MIN_PRI_PWR(ext_phy),
+		 MT_WF_PHY_PD_OFDM_MASK(ext_phy),
+		 MT_WF_PHY_PD_OFDM(ext_phy, 0x13c));
+	mt76_rmw(dev, MT_WF_PHY_RXTD_CCK_PD(ext_phy),
+		 MT_WF_PHY_PD_CCK_MASK(ext_phy),
+		 MT_WF_PHY_PD_CCK(ext_phy, 0x92));
 
 	phy->ofdm_sensitivity = -98;
 	phy->cck_sensitivity = -110;
@@ -1353,19 +1343,19 @@ void mt7615_mac_set_scs(struct mt7615_dev *dev, bool enable)
 		goto out;
 
 	if (enable) {
-		mt76_set(dev, MT_WF_PHY_B0_MIN_PRI_PWR,
-			 MT_WF_PHY_B0_PD_BLK);
-		mt76_set(dev, MT_WF_PHY_B1_MIN_PRI_PWR,
-			 MT_WF_PHY_B1_PD_BLK);
+		mt76_set(dev, MT_WF_PHY_MIN_PRI_PWR(0),
+			 MT_WF_PHY_PD_BLK(0));
+		mt76_set(dev, MT_WF_PHY_MIN_PRI_PWR(1),
+			 MT_WF_PHY_PD_BLK(1));
 		if (is_mt7622(&dev->mt76)) {
 			mt76_set(dev, MT_MIB_M0_MISC_CR, 0x7 << 8);
 			mt76_set(dev, MT_MIB_M0_MISC_CR, 0x7);
 		}
 	} else {
-		mt76_clear(dev, MT_WF_PHY_B0_MIN_PRI_PWR,
-			   MT_WF_PHY_B0_PD_BLK);
-		mt76_clear(dev, MT_WF_PHY_B1_MIN_PRI_PWR,
-			   MT_WF_PHY_B1_PD_BLK);
+		mt76_clear(dev, MT_WF_PHY_MIN_PRI_PWR(0),
+			   MT_WF_PHY_PD_BLK(0));
+		mt76_clear(dev, MT_WF_PHY_MIN_PRI_PWR(1),
+			   MT_WF_PHY_PD_BLK(1));
 	}
 
 	mt7615_mac_set_default_sensitivity(&dev->phy);
@@ -1440,24 +1430,15 @@ mt7615_mac_adjust_sensitivity(struct mt7615_phy *phy,
 
 		if (ofdm) {
 			val = *sensitivity * 2 + 512;
-			if (!ext_phy)
-				mt76_rmw(dev, MT_WF_PHY_B0_MIN_PRI_PWR,
-					 MT_WF_PHY_B0_PD_OFDM_MASK,
-					 MT_WF_PHY_B0_PD_OFDM(val));
-			else
-				mt76_rmw(dev, MT_WF_PHY_B1_MIN_PRI_PWR,
-					 MT_WF_PHY_B1_PD_OFDM_MASK,
-					 MT_WF_PHY_B1_PD_OFDM(val));
+			mt76_rmw(dev, MT_WF_PHY_MIN_PRI_PWR(ext_phy),
+				 MT_WF_PHY_PD_OFDM_MASK(ext_phy),
+				 MT_WF_PHY_PD_OFDM(ext_phy, val));
 		} else {
 			val = *sensitivity + 256;
 			if (!ext_phy)
-				mt76_rmw(dev, MT_WF_PHY_B0_RXTD_CCK_PD,
-					 MT_WF_PHY_B0_PD_CCK_MASK,
-					 MT_WF_PHY_B0_PD_CCK(val));
-			else
-				mt76_rmw(dev, MT_WF_PHY_B1_RXTD_CCK_PD,
-					 MT_WF_PHY_B1_PD_CCK_MASK,
-					 MT_WF_PHY_B1_PD_CCK(val));
+			mt76_rmw(dev, MT_WF_PHY_RXTD_CCK_PD(ext_phy),
+				 MT_WF_PHY_PD_CCK_MASK(ext_phy),
+				 MT_WF_PHY_PD_CCK(ext_phy, val));
 		}
 		phy->last_cca_adj = jiffies;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 26d121646787..f48f3a6f48f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -81,7 +81,7 @@
 #define MT_WF_PHY_BASE			0x10000
 #define MT_WF_PHY(ofs)			(MT_WF_PHY_BASE + (ofs))
 
-#define MT_WF_PHY_WF2_RFCTRL0(n)	MT_WF_PHY(0x1900 + ((n) * 0x400))
+#define MT_WF_PHY_WF2_RFCTRL0(n)	MT_WF_PHY(0x1900 + (n) * 0x400)
 #define MT_WF_PHY_WF2_RFCTRL0_LPBCN_EN	BIT(9)
 
 #define MT_WF_PHY_R0_PHYMUX_5(_phy)	MT_WF_PHY(0x0614 + ((_phy) << 9))
@@ -94,23 +94,16 @@
 #define MT_WF_PHYCTRL_STAT_MDRDY_OFDM	GENMASK(31, 16)
 #define MT_WF_PHYCTRL_STAT_MDRDY_CCK	GENMASK(15, 0)
 
-#define MT_WF_PHY_B0_MIN_PRI_PWR	MT_WF_PHY(0x229c)
-#define MT_WF_PHY_B0_PD_OFDM_MASK	GENMASK(28, 20)
-#define MT_WF_PHY_B0_PD_OFDM(v)		((v) << 20)
-#define MT_WF_PHY_B0_PD_BLK		BIT(19)
+#define MT_WF_PHY_MIN_PRI_PWR(_phy)	MT_WF_PHY((_phy) ? 0x084 : 0x229c)
+#define MT_WF_PHY_PD_OFDM_MASK(_phy)	((_phy) ? GENMASK(24, 16) : \
+					 GENMASK(28, 20))
+#define MT_WF_PHY_PD_OFDM(_phy, v)	((v) << ((_phy) ? 16 : 20))
+#define MT_WF_PHY_PD_BLK(_phy)		((_phy) ? BIT(25) : BIT(19))
 
-#define MT_WF_PHY_B1_MIN_PRI_PWR	MT_WF_PHY(0x084)
-#define MT_WF_PHY_B1_PD_OFDM_MASK	GENMASK(24, 16)
-#define MT_WF_PHY_B1_PD_OFDM(v)		((v) << 16)
-#define MT_WF_PHY_B1_PD_BLK		BIT(25)
-
-#define MT_WF_PHY_B0_RXTD_CCK_PD	MT_WF_PHY(0x2310)
-#define MT_WF_PHY_B0_PD_CCK_MASK	GENMASK(8, 1)
-#define MT_WF_PHY_B0_PD_CCK(v)		((v) << 1)
-
-#define MT_WF_PHY_B1_RXTD_CCK_PD	MT_WF_PHY(0x2314)
-#define MT_WF_PHY_B1_PD_CCK_MASK	GENMASK(31, 24)
-#define MT_WF_PHY_B1_PD_CCK(v)		((v) << 24)
+#define MT_WF_PHY_RXTD_CCK_PD(_phy)	MT_WF_PHY((_phy) ? 0x2314 : 0x2310)
+#define MT_WF_PHY_PD_CCK_MASK(_phy)	(_phy) ? GENMASK(31, 24) : \
+					 GENMASK(8, 1)
+#define MT_WF_PHY_PD_CCK(_phy, v)	((v) << ((_phy) ? 24 : 1))
 
 #define MT_WF_CFG_BASE			0x20200
 #define MT_WF_CFG(ofs)			(MT_WF_CFG_BASE + (ofs))
@@ -121,15 +114,6 @@
 #define MT_CFG_CCR_MAC_D1_2X_GC_EN	BIT(30)
 #define MT_CFG_CCR_MAC_D0_2X_GC_EN	BIT(31)
 
-#define MT_DBDC_CTRL0			MT_WF_CFG(0x050)
-#define MT_DBDC_CTRL0_OMAC_00_04	GENMASK(4, 0)
-#define MT_DBDC_CTRL0_OMAC_11_1F	GENMASK(19, 5)
-#define MT_DBDC_CTRL0_MGMT		GENMASK(21, 20)
-#define MT_DBDC_CTRL0_WMM		GENMASK(25, 22)
-#define MT_DBDC_CTRL0_DBDC_EN		BIT(31)
-
-#define MT_DBDC_CTRL1			MT_WF_CFG(0x054)
-
 #define MT_WF_AGG_BASE			0x20a00
 #define MT_WF_AGG(ofs)			(MT_WF_AGG_BASE + (ofs))
 
@@ -140,8 +124,8 @@
 #define MT_AGG_ARCR_RATE_DOWN_RATIO_EN	BIT(19)
 #define MT_AGG_ARCR_RATE_UP_EXTRA_TH	GENMASK(22, 20)
 
-#define MT_AGG_ARUCR			MT_WF_AGG(0x018)
-#define MT_AGG_ARDCR			MT_WF_AGG(0x01c)
+#define MT_AGG_ARUCR(_band)		MT_WF_AGG(0x018 + (_band) * 0x100)
+#define MT_AGG_ARDCR(_band)		MT_WF_AGG(0x01c + (_band) * 0x100)
 #define MT_AGG_ARxCR_LIMIT_SHIFT(_n)	(4 * (_n))
 #define MT_AGG_ARxCR_LIMIT(_n)		GENMASK(2 + \
 					MT_AGG_ARxCR_LIMIT_SHIFT(_n), \
@@ -151,8 +135,7 @@
 #define MT_AGG_ASRCR1			MT_WF_AGG(0x064)
 #define MT_AGG_ASRCR_RANGE(val, n)	(((val) >> ((n) << 3)) & GENMASK(5, 0))
 
-#define MT_AGG_ACR0			MT_WF_AGG(0x070)
-#define MT_AGG_ACR1			MT_WF_AGG(0x170)
+#define MT_AGG_ACR(_band)		MT_WF_AGG(0x070 + (_band) * 0x100)
 #define MT_AGG_ACR_NO_BA_RULE		BIT(0)
 #define MT_AGG_ACR_NO_BA_AR_RULE	BIT(1)
 #define MT_AGG_ACR_PKT_TIME_EN		BIT(2)
@@ -179,13 +162,11 @@
 #define MT_TIMEOUT_VAL_PLCP		GENMASK(15, 0)
 #define MT_TIMEOUT_VAL_CCA		GENMASK(31, 16)
 
-#define MT_TMAC_TRCR0			MT_WF_TMAC(0x09c)
-#define MT_TMAC_TRCR1			MT_WF_TMAC(0x070)
+#define MT_TMAC_TRCR(_band)		MT_WF_TMAC((_band) ? 0x070 : 0x09c)
 #define MT_TMAC_TRCR_CCA_SEL		GENMASK(31, 30)
 #define MT_TMAC_TRCR_SEC_CCA_SEL	GENMASK(29, 28)
 
-#define MT_TMAC_ICR0			MT_WF_TMAC(0x0a4)
-#define MT_TMAC_ICR1			MT_WF_TMAC(0x074)
+#define MT_TMAC_ICR(_band)		MT_WF_TMAC((_band) ? 0x074 : 0x0a4)
 #define MT_IFS_EIFS			GENMASK(8, 0)
 #define MT_IFS_RIFS			GENMASK(14, 10)
 #define MT_IFS_SIFS			GENMASK(22, 16)
@@ -249,8 +230,7 @@
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 2)
 #define MT_DMA_DCR0_RX_VEC_DROP		BIT(17)
 
-#define MT_DMA_BN0RCFR0			MT_WF_DMA(0x070)
-#define MT_DMA_BN1RCFR0			MT_WF_DMA(0x0b0)
+#define MT_DMA_RCFR0(_band)		MT_WF_DMA(0x070 + (_band) * 0x40)
 #define MT_DMA_RCFR0_MCU_RX_MGMT	BIT(2)
 #define MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR	BIT(3)
 #define MT_DMA_RCFR0_MCU_RX_CTL_BAR	BIT(4)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
