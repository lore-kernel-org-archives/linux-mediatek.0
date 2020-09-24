Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D7CC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:24:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C136121D24
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QvB56Phg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QCasCKcx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C136121D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgaWlu03L5vwVg4T3JJ9nROEsIswO30x3I9+2hUYkaY=; b=QvB56PhgtC5a/eDJl4y2V6B8e4
	JudXTBb/k8uL0JBNX+AA/4m3yGyl5lskEI7/HoE5zzBgXa9LhBUwkp8qr9ICYW+pAO610XbENm0RR
	SQDL7i+MB71AvAGYv/OMyybgOfzIw9XLtk6xBd6wITOjTesPOM2HWzQiBooeqOKSDh3FxGzN1u0dq
	w3bMiLvASHsltkbUH5n9J3o3WXHQAi4HI5nf23G4BVjmvlYIE34tf3kiWQeMvKXEzBZG/HmiDGTyB
	dxvqYVCMxD9hgDMROjVOEwsuz1oVC2fv220NXcWJxCrh+TXrnO/cMhrkinguJnWMzI83HBCIspen8
	EWH05CZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLT6M-0002dM-VS; Thu, 24 Sep 2020 15:24:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLT6I-0002bb-Ol
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 15:24:04 +0000
X-UUID: 4ca1a46bef2f4a8795fcf41c257f32a1-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OTCsfNo99ojtjb1h0R1ye7ZsuTV+XjaLXSyLcJ3cg0E=; 
 b=QCasCKcx9+Q0MxhQuaujX8t7kahuG83drD+kHDEORaNJEGY/Uh9h0AXjX/FEK8AcDBqvHgCrci9kmOJaep+72eaaL6NqZ6QC/S9dmxHZWQlBapyKYGJ1Dj6RlwPKMAL85pMAwPxyp3KzsaD3TIh5eF+N0Zkuwejkl1pT2qxzApM=;
X-UUID: 4ca1a46bef2f4a8795fcf41c257f32a1-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1169451962; Thu, 24 Sep 2020 07:23:31 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 08:23:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 23:23:13 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: measure channel noise and report it via
 survey
Date: Thu, 24 Sep 2020 23:23:13 +0800
Message-ID: <670fe8dcb9e1308041047718af241225ff5614bb.1600960534.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7E353855B9F60CF3FD2186DF9C4F0CBE4BA96433650EDF6132C8388890D68BEE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112402_988012_7735995D 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: linux-mediatek@lists.infradead.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Read per-stream measurements every 100 ms and build a simple moving average.

Tested-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 50 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  8 +++
 4 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index b35222c0e271..90849a00c550 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1085,17 +1085,49 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 		   MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
 }
 
-/*
- * TODO: mib counters are read-clear and there're many HE functionalities need
- * such info, hence firmware prepares a task to read the fields out to a shared
- * structure. User should switch to use event format to avoid race condition.
- */
+void mt7915_mac_enable_nf(struct mt7915_dev *dev, bool ext_phy)
+{
+	mt7915_l2_set(dev, MT_WF_PHY_RXTD12(ext_phy),
+		      MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY |
+		      MT_WF_PHY_RXTD12_IRPI_SW_CLR);
+
+	mt7915_l2_set(dev, MT_WF_PHY_RX_CTRL1(ext_phy),
+		      FIELD_PREP(MT_WF_PHY_RX_CTRL1_IPI_EN, 0x5));
+}
+
+static u8
+mt7915_phy_get_nf(struct mt7915_phy *phy, int idx)
+{
+	static const u8 nf_power[] = { 92, 89, 86, 83, 80, 75, 70, 65, 60, 55, 52 };
+	struct mt7915_dev *dev = phy->dev;
+	u32 val, sum = 0, n = 0;
+	int nss, i;
+
+	/* TODO: DBDC: 0,1 for 2.4G, 2,3 for 5G */
+	for (nss = 0; nss < hweight8(phy->chainmask); nss++) {
+		u32 reg = MT_WF_IRPI(nss);
+
+		for (i = 0; i < ARRAY_SIZE(nf_power); i++, reg += 4) {
+			val = mt7915_l2_rr(dev, reg);
+			sum += val * nf_power[i];
+			n += val;
+		}
+	}
+
+	if (!n)
+		return 0;
+
+	return sum / n;
+}
+
 static void
 mt7915_phy_update_channel(struct mt76_phy *mphy, int idx)
 {
 	struct mt7915_dev *dev = container_of(mphy->dev, struct mt7915_dev, mt76);
+	struct mt7915_phy *phy = (struct mt7915_phy *)mphy->priv;
 	struct mt76_channel_state *state;
 	u64 busy_time, tx_time, rx_time, obss_time;
+	int nf;
 
 	busy_time = mt76_get_field(dev, MT_MIB_SDR9(idx),
 				   MT_MIB_SDR9_BUSY_MASK);
@@ -1106,12 +1138,18 @@ mt7915_phy_update_channel(struct mt76_phy *mphy, int idx)
 	obss_time = mt76_get_field(dev, MT_WF_RMAC_MIB_AIRTIME14(idx),
 				   MT_MIB_OBSSTIME_MASK);
 
-	/* TODO: state->noise */
+	nf = mt7915_phy_get_nf(phy, idx);
+	if (!phy->noise)
+		phy->noise = nf << 4;
+	else if (nf)
+		phy->noise += nf - (phy->noise >> 4);
+
 	state = mphy->chan_state;
 	state->cc_busy += busy_time;
 	state->cc_tx += tx_time;
 	state->cc_rx += rx_time + obss_time;
 	state->cc_bss_rx += rx_time;
+	state->noise = -(phy->noise >> 4);
 }
 
 void mt7915_update_channel(struct mt76_dev *mdev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index c48158392057..4cbeffeabbe1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -34,12 +34,14 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		mt7915_mcu_set_pm(dev, 0, 0);
 		mt7915_mcu_set_mac(dev, 0, true, false);
 		mt7915_mcu_set_scs(dev, 0, true);
+		mt7915_mac_enable_nf(dev, 0);
 	}
 
 	if (phy != &dev->phy) {
 		mt7915_mcu_set_pm(dev, 1, 0);
 		mt7915_mcu_set_mac(dev, 1, true, false);
 		mt7915_mcu_set_scs(dev, 1, true);
+		mt7915_mac_enable_nf(dev, 1);
 	}
 
 	mt7915_mcu_set_sku_en(phy, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index ba7998724716..c01c278eb27e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -429,6 +429,7 @@ mt7915_l2_rmw(struct mt7915_dev *dev, u32 addr, u32 mask, u32 val)
 bool mt7915_mac_wtbl_update(struct mt7915_dev *dev, int idx, u32 mask);
 void mt7915_mac_reset_counters(struct mt7915_phy *phy);
 void mt7915_mac_cca_stats_reset(struct mt7915_phy *phy);
+void mt7915_mac_enable_nf(struct mt7915_dev *dev, bool ext_phy);
 void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, bool beacon);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 70e98a275122..6837596cb25f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -396,11 +396,19 @@ static inline u32 mt7915_int_rx_mask(enum mt76_rxq_id q)
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
 #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
 
+#define MT_WF_IRPI_BASE			0x83006000
+#define MT_WF_IRPI(ofs)			(MT_WF_IRPI_BASE + ((ofs) << 16))
+
 /* PHY: band 0(0x83080000), band 1(0x83090000) */
 #define MT_WF_PHY_BASE			0x83080000
 #define MT_WF_PHY(ofs)			(MT_WF_PHY_BASE + (ofs))
 
 #define MT_WF_PHY_RX_CTRL1(_phy)	MT_WF_PHY(0x2004 + ((_phy) << 16))
+#define MT_WF_PHY_RX_CTRL1_IPI_EN	GENMASK(2, 0)
 #define MT_WF_PHY_RX_CTRL1_STSCNT_EN	GENMASK(11, 9)
 
+#define MT_WF_PHY_RXTD12(_phy)		MT_WF_PHY(0x8230 + ((_phy) << 16))
+#define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
+#define MT_WF_PHY_RXTD12_IRPI_SW_CLR	BIT(29)
+
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
