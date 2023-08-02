Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC0FC41513
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jCiKWJVauQRsyD1Zkeszjicqclds7bkaHbOE0OtFJR0=; b=1Z+iYYOYrs8mlup7q2hNOENbHy
	ktyoViIVOLqRAHguyaRpTxXb1l0GSl6y0t3JpC5iILKLMGmEJ6GD9E+ZNCkCDXTab7JykPNTs+3Bm
	3lzIatNOS4yj7D1LuqSM8gb/gievZy/dt6zQG6l7LHO2yQ1+QhKSCO0fvJ7dxCSbtYlgp2qX62mwj
	1wF+LiGS7K1NheSEUWg9t739h3+tr6u66kD0jOk2SM3i5BH7gl+L/uvW8C4PCkUguHDsqgYwg1Mnq
	UmY8w6G3+5A8Kery+zEqt8aUN8TMAw5JS8XEous2ZOoHBOahh9NZy7fOJa6S3ghO8NSiDPnPd2Uzl
	UlGLTVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRH4l-005gpS-0k;
	Wed, 02 Aug 2023 19:00:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRH4i-005gnd-0a
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 19:00:01 +0000
X-UUID: c108b54e316611ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jCiKWJVauQRsyD1Zkeszjicqclds7bkaHbOE0OtFJR0=;
	b=CJhwSJbrIGJvEIPWlHdaJmMdgH4OIH5E36rjnS1SewjIYP/lqDJPp2K1rQtARe9q5raI3S5otEIPRnQ6fIZeBR8DQdso4H7AEsX9dVm48wukLVcjZD3tHKOI35ioBsHMjg2t/LEyXd/1/Fyzsnm+ZMifWNWP8FeypA/3bMfDNq0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:a7cb3c83-db51-4401-9094-203397217cf0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:016d9ed2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c108b54e316611ee912e1518a6540028-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1628939027; Wed, 02 Aug 2023 11:59:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 02:49:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 02:49:46 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: enable BSS_CHANGED_MU_GROUPS support
Date: Thu, 3 Aug 2023 02:49:44 +0800
Message-ID: <ff63866d7d62d088edd4a9f7587320f8f59a361f.1690999957.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_120000_228135_A1E15A53 
X-CRM114-Status: GOOD (  14.30  )
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

The Group ID Management frame is an Action frame of category VHT.
It is transmitted by the AP to assign or change the user position
of a STA for one or more group IDs.

Also, sniffer can use a given group id to monitor STA that belongs
to that group.

Notify underlying driver of changes via BSS_CHANGED_MU_GROUPS.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Change-Id: I3d2f5508a2b6eb7c929c3997c31a9285713c8bea
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 31 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 12 +++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ee976657bfc3..794469fdedac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -370,6 +370,7 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_FILS_DISCOVERY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MU_MIMO_AIR_SNIFFER);
 
 	if (!is_mt7915(&dev->mt76))
 		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index f8d6323bd42d..102cbc4da2f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -593,6 +593,34 @@ mt7915_update_bss_color(struct ieee80211_hw *hw,
 	}
 }
 
+static void
+mt7915_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       struct ieee80211_bss_conf *info)
+{
+	struct mt7915_phy *phy = mt7915_hw_phy(hw);
+	struct mt7915_dev *dev = mt7915_hw_dev(hw);
+	u8 i, band = phy->mt76->band_idx;
+	u32 *mu;
+
+	mu = (u32 *)info->mu_group.membership;
+	for (i = 0; i < WLAN_MEMBERSHIP_LEN / sizeof(*mu); i++) {
+		if (is_mt7916(&dev->mt76))
+			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_VLD_MT7916(band, i),
+				mu[i]);
+		else
+			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_VLD(band, i), mu[i]);
+	}
+
+	mu = (u32 *)info->mu_group.position;
+	for (i = 0; i < WLAN_USER_POSITION_LEN / sizeof(*mu); i++) {
+		if (is_mt7916(&dev->mt76))
+			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_POS_MT7916(band, i),
+				mu[i]);
+		else
+			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_POS(band, i), mu[i]);
+	}
+}
+
 static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_bss_conf *info,
@@ -646,6 +674,9 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		       BSS_CHANGED_FILS_DISCOVERY))
 		mt7915_mcu_add_beacon(hw, vif, info->enable_beacon, changed);
 
+	if (changed & BSS_CHANGED_MU_GROUPS)
+		mt7915_update_mu_group(hw, vif, info);
+
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 588cd87e24e9..534e039e0deb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -1197,13 +1197,21 @@ enum offs_rev {
 #define MT_WF_PHY_BASE			0x83080000
 #define MT_WF_PHY(ofs)			(MT_WF_PHY_BASE + (ofs))
 
+#define MT_WF_PHY_RX_GID_TAB_VLD(_n, i)		MT_WF_PHY(0x1054 + (i) * 4 + \
+							  ((_n) << 16))
+#define MT_WF_PHY_RX_GID_TAB_VLD_MT7916(_n, i)	MT_WF_PHY(0x1054 + (i) * 4 + \
+							  ((_n) << 20))
+#define MT_WF_PHY_RX_GID_TAB_POS(_n, i)		MT_WF_PHY(0x105c + (i) * 4 + \
+							  ((_n) << 16))
+#define MT_WF_PHY_RX_GID_TAB_POS_MT7916(_n, i)	MT_WF_PHY(0x105c + (i) * 4 + \
+							  ((_n) << 20))
 #define MT_WF_PHY_RX_CTRL1(_phy)	MT_WF_PHY(0x2004 + ((_phy) << 16))
 #define MT_WF_PHY_RX_CTRL1_MT7916(_phy)	MT_WF_PHY(0x2004 + ((_phy) << 20))
 #define MT_WF_PHY_RX_CTRL1_IPI_EN	GENMASK(2, 0)
 #define MT_WF_PHY_RX_CTRL1_STSCNT_EN	GENMASK(11, 9)
 
-#define MT_WF_PHY_RXTD12(_phy)		MT_WF_PHY(0x8230 + ((_phy) << 16))
-#define MT_WF_PHY_RXTD12_MT7916(_phy)	MT_WF_PHY(0x8230 + ((_phy) << 20))
+#define MT_WF_PHY_RXTD12(_phy)			MT_WF_PHY(0x8230 + ((_phy) << 16))
+#define MT_WF_PHY_RXTD12_MT7916(_phy)		MT_WF_PHY(0x8230 + ((_phy) << 20))
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR		BIT(29)
 
-- 
2.18.0


