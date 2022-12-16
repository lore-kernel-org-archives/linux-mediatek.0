Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1548C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKr+SwCC0PJAiiKL7M+qmAbvFuFIn1LNZ/mKqNJilWQ=; b=kuHIIdNQWAwPBxD4weGVEtKUrg
	XmB6cyViE7GaumV08MDKJTYgxqbVCUzfvhD1lC8g5ITNi1HCmii6Ca2PzuiXI6H4XkLyfnfcAUNVs
	J8G6WwQei/Ll61qeqRA4Kk2mGF6BmmLpaQ33yvTrqhwFnC2zb2jPIuCMCHDb9eJj0JuR5s1ri77Ot
	dB+og9um5JBIDOeNGB+nKZRH8momRFTkLYCGWpY8Dptn7yOPVCt2/3weV4XXnwPpEvfSeO49o13hq
	ZNZPpTeVBJrtw+A+kdszxd+Nj2FSCDvlM7g56kSf9L4nRBbkNz5YLiX7Cjo3fbCZ62X3nY/DaWncq
	CmD0no/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Aic-00FHjY-Lo; Fri, 16 Dec 2022 13:25:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AiW-00FHfy-K2
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 13:25:38 +0000
X-UUID: f2d9476e661347938a5b59bfba86efc2-20221216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wKr+SwCC0PJAiiKL7M+qmAbvFuFIn1LNZ/mKqNJilWQ=;
	b=Zn6G3SfQTx/2NirNctfNwYIt1gNg4gFX28NUJSrE2FN77/oKMMsLA9lCshFMyTMDLE0UZdTisB39pDCmFN0x8Zkb0GbSnsWVuPlZoUHVadyXTQnkShRLdIC1jQzUDNNO4nl4/frE0S+ck7jFLN5agKL/3NoKu2u3cGUaqbsZHA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:23a86878-3080-472e-8956-2d626afc2347,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:1f00f551-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f2d9476e661347938a5b59bfba86efc2-20221216
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1305665510; Fri, 16 Dec 2022 06:22:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Dec 2022 21:11:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 21:11:29 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: add ack signal support
Date: Fri, 16 Dec 2022 21:11:20 +0800
Message-ID: <b2f1f90b787a6b29df5a3e7e8842591325b0c74e.1671193434.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_052536_691492_1755F3A3 
X-CRM114-Status: GOOD (  12.37  )
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

This reports signal strength of ACK packets from the peer as measured
at each interface.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c  |  9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c   | 15 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c  |  8 ++++++++
 .../net/wireless/mediatek/mt76/mt7921/mt7921.h    |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h  |  8 ++++++++
 5 files changed, 45 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index d4b681d7e1d2..2dade2c039f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -120,6 +120,7 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_VHT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
@@ -142,6 +143,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 static void
 mt7921_mac_init_band(struct mt7921_dev *dev, u8 band)
 {
+	u32 mask, set;
+
 	mt76_rmw_field(dev, MT_TMAC_CTCR0(band),
 		       MT_TMAC_CTCR0_INS_DDLMT_REFTIME, 0x3f);
 	mt76_set(dev, MT_TMAC_CTCR0(band),
@@ -158,6 +161,12 @@ mt7921_mac_init_band(struct mt7921_dev *dev, u8 band)
 	mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_MAX_RX_LEN, 1536);
 	/* disable rx rate report by default due to hw issues */
 	mt76_clear(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN);
+
+	/* filter out non-resp frames and get instantaneous signal reporting */
+	mask = MT_WTBLOFF_TOP_RSCR_RCPI_MODE | MT_WTBLOFF_TOP_RSCR_RCPI_PARAM;
+	set = FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_MODE, 0) |
+	      FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_PARAM, 0x3);
+	mt76_rmw(dev, MT_WTBLOFF_TOP_RSCR(band), mask, set);
 }
 
 u8 mt7921_check_offload_capability(struct device *dev, const char *fw_wm)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 82db3762be33..557c20190c2b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -59,6 +59,7 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 	u32 tx_time[IEEE80211_NUM_ACS], rx_time[IEEE80211_NUM_ACS];
 	LIST_HEAD(sta_poll_list);
 	struct rate_info *rate;
+	s8 rssi[4];
 	int i;
 
 	spin_lock_bh(&dev->sta_poll_lock);
@@ -160,6 +161,20 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 			else
 				rate->flags &= ~RATE_INFO_FLAGS_SHORT_GI;
 		}
+
+		/* get signal strength of resp frames (CTS/BA/ACK) */
+		addr = mt7921_mac_wtbl_lmac_addr(idx, 30);
+		val = mt76_rr(dev, addr);
+
+		rssi[0] = to_rssi(GENMASK(7, 0), val);
+		rssi[1] = to_rssi(GENMASK(15, 8), val);
+		rssi[2] = to_rssi(GENMASK(23, 16), val);
+		rssi[3] = to_rssi(GENMASK(31, 14), val);
+
+		msta->ack_signal =
+			mt76_rx_signal(msta->vif->phy->mt76->antenna_mask, rssi);
+
+		ewma_avg_signal_add(&msta->avg_ack_signal, -msta->ack_signal);
 	}
 }
 EXPORT_SYMBOL_GPL(mt7921_mac_sta_poll);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 76ac5069638f..d464f5c0e4e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -860,6 +860,8 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
 					    true, mvif->ctx);
 
+	ewma_avg_signal_init(&msta->avg_ack_signal);
+
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
@@ -1430,6 +1432,12 @@ static void mt7921_sta_statistics(struct ieee80211_hw *hw,
 	}
 	sinfo->txrate.flags = txrate->flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+
+	sinfo->ack_signal = (s8)msta->ack_signal;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
+
+	sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index efff4d43d796..e39b482e262c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -144,6 +144,8 @@ enum mt7921_rxq_id {
 	MT7921_RXQ_MCU_WM = 0,
 };
 
+DECLARE_EWMA(avg_signal, 10, 8)
+
 struct mt7921_sta {
 	struct mt76_wcid wcid; /* must be first */
 
@@ -152,6 +154,9 @@ struct mt7921_sta {
 	struct list_head poll_list;
 	u32 airtime_ac[8];
 
+	int ack_signal;
+	struct ewma_avg_signal avg_ack_signal;
+
 	unsigned long last_txs;
 	unsigned long ampdu_state;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index c65582acfa55..e52977ff3349 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -80,6 +80,14 @@
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 3)
 #define MT_DMA_DCR0_RXD_G5_EN		BIT(23)
 
+/* WTBLOFF TOP: band 0(0x820e9000),band 1(0x820f9000) */
+#define MT_WTBLOFF_TOP_BASE(_band)	((_band) ? 0x820f9000 : 0x820e9000)
+#define MT_WTBLOFF_TOP(_band, ofs)	(MT_WTBLOFF_TOP_BASE(_band) + (ofs))
+
+#define MT_WTBLOFF_TOP_RSCR(_band)	MT_WTBLOFF_TOP(_band, 0x008)
+#define MT_WTBLOFF_TOP_RSCR_RCPI_MODE	GENMASK(31, 30)
+#define MT_WTBLOFF_TOP_RSCR_RCPI_PARAM	GENMASK(25, 24)
+
 /* LPON: band 0(0x24200), band 1(0xa4200) */
 #define MT_WF_LPON_BASE(_band)		((_band) ? 0x820fb000 : 0x820eb000)
 #define MT_WF_LPON(_band, ofs)		(MT_WF_LPON_BASE(_band) + (ofs))
-- 
2.18.0


