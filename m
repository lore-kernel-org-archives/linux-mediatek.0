Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC58AC54FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 16:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B19A20767
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 16:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4v9JaBl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0qWIYaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B19A20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2lwmu/7CqfobVlas+hJEbjpI26lopsE4ICbC1kwsPik=; b=W4v9JaBlfME/Ce
	vhc+7Ns/DIAOqTAyfTexL+hGOcfo0+3qdph097oQrEiU9TjN/g3NSQtr2dZmmSyMtkcQQJue5L4za
	6JmdraIzZnlyoNAC2IM0Kb2Tc46MMbioXMxPh3727OAskRqxmBU7jr57qnS1gJht5nzkdBbG2Wixv
	F8NHX7awWfBStg0rCxHiMQ2TjvmGgDSDr4ap08IkBm8zH5lXXxCK5zMCT8bDCvpWite2f19/kjAvK
	lfFnOyIIXMNhm9pNaeKn95cUnQLmcMUyS6DjkBcBrlGSjtxUBOYyY/DPb2gkljlvcDugV6Fqtj/kT
	iHrWCrzI1aahfbNhIzTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRIFy-0004rt-7c; Wed, 22 Apr 2020 16:29:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRIFv-0004qR-HS
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 16:29:48 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B812720767;
 Wed, 22 Apr 2020 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587572983;
 bh=Ooc8+iitGuGTvPIZhXQ6/DoHM2Ft979BZxMBSa2TmJU=;
 h=From:To:Cc:Subject:Date:From;
 b=C0qWIYaLmUCSBzwq+Bp8LNI3mJcxEzElYh9KbaXfzkHH+k7bEJDxpY6AhA2gx/tHc
 qar/05evk+0ki7D49loFFzDh9FSG/CTwt8rO6LYc6w1s1oPxZEMOQeRhr6rWCu8Esb
 MPRKX0Am/cdKNEaytlwU+TcPKf9oo/gZhPa6vkGs=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: enable TDLS support
Date: Wed, 22 Apr 2020 18:29:32 +0200
Message-Id: <8915f055d3a78e0a27946ad2f5f8feef854fea39.1587572853.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_092947_619964_8CFCFAFD 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable mac80211 TDLS support by default. Disable TDLS hw filtering for
mt7615 devices

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h | 8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c  | 1 +
 6 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 39abedc45e4a..0e26f5dac8e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -279,7 +279,8 @@ mt76_phy_init(struct mt76_dev *dev, struct ieee80211_hw *hw)
 	SET_IEEE80211_PERM_ADDR(hw, dev->macaddr);
 
 	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
-	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
+	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
+			WIPHY_FLAG_SUPPORTS_TDLS;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 6fc3f5aa94c0..9880643888ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -63,6 +63,7 @@ mt7615_init_mac_chain(struct mt7615_dev *dev, int chain)
 		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
 		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1));
 
+	mt76_clear(dev, MT_DMA_RCFR0(chain), MT_DMA_RCFR0_MCU_RX_TDLS);
 	if (!mt7615_firmware_offload(dev)) {
 		u32 mask, set;
 
@@ -117,6 +118,8 @@ void mt7615_mac_init(struct mt7615_dev *dev)
 	mt76_wr(dev, MT_DMA_DCR0,
 		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072) |
 		MT_DMA_DCR0_RX_VEC_DROP);
+	/* disable TDLS filtering */
+	mt76_clear(dev, MT_WF_PFCR, MT_WF_PFCR_TDLS_EN);
 	mt76_set(dev, MT_WF_MIB_SCR0, MT_MIB_SCR0_AGG_CNT_RANGE_EN);
 	if (is_mt7663(&dev->mt76)) {
 		mt76_wr(dev, MT_WF_AGG(0x160), 0x5c341c02);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3c35b8d0489c..4e1d162b2664 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -542,7 +542,7 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->wcid.idx = idx;
 	msta->wcid.ext_phy = mvif->band_idx;
 
-	if (vif->type == NL80211_IFTYPE_STATION) {
+	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls) {
 		struct mt7615_phy *phy;
 
 		phy = mvif->band_idx ? mt7615_ext_phy(dev) : &dev->phy;
@@ -565,7 +565,7 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7615_mcu_sta_add(dev, vif, sta, false);
 	mt7615_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-	if (vif->type == NL80211_IFTYPE_STATION) {
+	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls) {
 		struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 		struct mt7615_phy *phy;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index 26a297893da6..12bca2dee781 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -21,6 +21,7 @@ const u32 mt7615e_reg_map[] = {
 	[MT_TMAC_BASE]		= 0x21000,
 	[MT_RMAC_BASE]		= 0x21200,
 	[MT_DMA_BASE]		= 0x21800,
+	[MT_PF_BASE]		= 0x22000,
 	[MT_WTBL_BASE_ON]	= 0x23000,
 	[MT_WTBL_BASE_OFF]	= 0x23400,
 	[MT_LPON_BASE]		= 0x24200,
@@ -45,6 +46,7 @@ const u32 mt7663e_reg_map[] = {
 	[MT_TMAC_BASE]		= 0x24000,
 	[MT_RMAC_BASE]		= 0x25000,
 	[MT_DMA_BASE]		= 0x27000,
+	[MT_PF_BASE]		= 0x28000,
 	[MT_WTBL_BASE_ON]	= 0x29000,
 	[MT_WTBL_BASE_OFF]	= 0x29800,
 	[MT_LPON_BASE]		= 0x2b000,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 054831ecad68..68d30bcc087a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -18,6 +18,7 @@ enum mt7615_reg_base {
 	MT_TMAC_BASE,
 	MT_RMAC_BASE,
 	MT_DMA_BASE,
+	MT_PF_BASE,
 	MT_WTBL_BASE_ON,
 	MT_WTBL_BASE_OFF,
 	MT_LPON_BASE,
@@ -321,10 +322,17 @@ enum mt7615_reg_base {
 #define MT_DMA_RCFR0_MCU_RX_MGMT	BIT(2)
 #define MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR	BIT(3)
 #define MT_DMA_RCFR0_MCU_RX_CTL_BAR	BIT(4)
+#define MT_DMA_RCFR0_MCU_RX_TDLS	BIT(19)
 #define MT_DMA_RCFR0_MCU_RX_BYPASS	BIT(21)
 #define MT_DMA_RCFR0_RX_DROPPED_UCAST	GENMASK(25, 24)
 #define MT_DMA_RCFR0_RX_DROPPED_MCAST	GENMASK(27, 26)
 
+#define MT_WF_PF_BASE			((dev)->reg_map[MT_PF_BASE])
+#define MT_WF_PF(ofs)			(MT_WF_PF_BASE + (ofs))
+
+#define MT_WF_PFCR			MT_WF_PF(0x000)
+#define MT_WF_PFCR_TDLS_EN		BIT(9)
+
 #define MT_WTBL_BASE(dev)		((dev)->reg_map[MT_WTBL_BASE_ADDR])
 #define MT_WTBL_ENTRY_SIZE		256
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index eee6f820959f..bcd131969923 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -31,6 +31,7 @@ static const u32 mt7663u_reg_map[] = {
 	[MT_TMAC_BASE]		= 0x820f4000,
 	[MT_RMAC_BASE]		= 0x820f5000,
 	[MT_DMA_BASE]		= 0x820f7000,
+	[MT_PF_BASE]		= 0x820f8000,
 	[MT_WTBL_BASE_ON]	= 0x820f9000,
 	[MT_WTBL_BASE_OFF]	= 0x820f9800,
 	[MT_LPON_BASE]		= 0x820fb000,
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
