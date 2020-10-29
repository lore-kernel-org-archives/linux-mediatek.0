Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9ABC55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C86D20790
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgxtDAr8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="InjMPgxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C86D20790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LlBt5XLeJtgcwqhg1088oEI1Otl5VwRFwiGu0SEUMt4=; b=fgxtDAr8dUbNXQdOBaIIvby+D
	FKQT3E5c+jzqDT5cOUtMqGs89eTfWg6Pw4u3DjJnr0aMVAJdYKQy4p6hNmaxmcz0VCtEeLbk1AKEZ
	e2L+U9KMJ8FFzsBDJ3wqWTBQOalu67fzcYh3xpY6jXT/NvjIoA1S+m1RVZm7JBbs7bwRVRSEBm/KO
	+9hVUduT3tOW2iT6Sc2kTp7+U4lVQITVbNjN4e9Pgrwjdp+NUVbcDU4sWrlsizeOdYbI9LtpIHJmD
	hL8aVvWKlnjp0JAF2Ets50bJu5EB4TA6R05kSKjgK6q1PQE1ZNJwxjxepgdRjE6iO9p3ceP5kZdTt
	Ff8AbTESA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYBcM-0005uP-Oc; Thu, 29 Oct 2020 17:21:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYBcJ-0005sM-NS
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 17:21:41 +0000
X-UUID: b45608c707a54244aa63c8b0dbbe3876-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=c9kvr7J5GGrbTfdtR4sKt3gx4Tp/e01+dtXkSILl2Ao=; 
 b=InjMPgxVtPsJ5MwDi3R3Zn08KHy9LEELXzeMu/vMQ33ScFkMSTcckUlv0l9/UAI6V2rjuvbFHvT0U8a4QoM4Mc+uyG9HR/N/pwUrbskvwpxiyWxAplB7dOXF6Cb5N/sabrJ4qLuxujdnbBi/wblQfiDXRy2lZDmvtPGM1CebePI=;
X-UUID: b45608c707a54244aa63c8b0dbbe3876-20201029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1248734072; Thu, 29 Oct 2020 09:21:36 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:11:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 01:11:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Oct 2020 01:11:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/3] mt76: mt7615: support 16 interfaces
Date: Fri, 30 Oct 2020 01:11:17 +0800
Message-ID: <a4ad2ad2b3de3ced1ca2a214da598cd0a5fea604.1603988327.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
References: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBD24A653B63770ADA85F9FCD574D5FE244CBFA2D3D3201EE2D7A970A4E109652000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_132140_024749_A328ADD5 
X-CRM114-Status: GOOD (  19.49  )
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
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When looking for a MAC address slot, start by using main BSSID slots 1-3,
afterwards use 16 repeater mode BSSID slots, then start using the slots
usually used for AP mode.

This search order should prevent unnecessary conflicts with AP mode interfaces
on the same PHY.

Note that two PHYs share global 32 omac slots with each other.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  4 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 55 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 49 ++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    | 25 +++------
 5 files changed, 94 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 2a4db46727fb..68a7ed47524e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -221,7 +221,7 @@ static const struct ieee80211_iface_combination if_comb_radar[] = {
 	{
 		.limits = if_limits,
 		.n_limits = ARRAY_SIZE(if_limits),
-		.max_interfaces = 4,
+		.max_interfaces = MT7615_MAX_INTERFACES,
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
 		.radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
@@ -237,7 +237,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	{
 		.limits = if_limits,
 		.n_limits = ARRAY_SIZE(if_limits),
-		.max_interfaces = 4,
+		.max_interfaces = MT7615_MAX_INTERFACES,
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3186b7b2ca48..ad6c7297668d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -115,29 +115,50 @@ static void mt7615_stop(struct ieee80211_hw *hw)
 	mt7615_mutex_release(dev);
 }
 
-static int get_omac_idx(enum nl80211_iftype type, u32 mask)
+static inline int get_free_idx(u32 mask, u8 start, u8 end)
+{
+	return ffs(~mask & GENMASK(end, start));
+}
+
+static int get_omac_idx(enum nl80211_iftype type, u64 mask)
 {
 	int i;
 
 	switch (type) {
-	case NL80211_IFTYPE_MONITOR:
-	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_ADHOC:
-		/* ap use hw bssid 0 and ext bssid */
+	case NL80211_IFTYPE_STATION:
+		/* prefer hw bssid slot 1-3 */
+		i = get_free_idx(mask, HW_BSSID_1, HW_BSSID_3);
+		if (i)
+			return i - 1;
+
+		if (type != NL80211_IFTYPE_STATION)
+			break;
+
+		/* next, try to find a free repeater entry for the sta */
+		i = get_free_idx(mask >> REPEATER_BSSID_START, 0,
+				 REPEATER_BSSID_MAX - REPEATER_BSSID_START);
+		if (i)
+			return i + 32 - 1;
+
+		i = get_free_idx(mask, EXT_BSSID_1, EXT_BSSID_MAX);
+		if (i)
+			return i - 1;
+
 		if (~mask & BIT(HW_BSSID_0))
 			return HW_BSSID_0;
 
-		for (i = EXT_BSSID_1; i < EXT_BSSID_END; i++)
-			if (~mask & BIT(i))
-				return i;
-
 		break;
-	case NL80211_IFTYPE_STATION:
-		/* sta use hw bssid other than 0 */
-		for (i = HW_BSSID_1; i < HW_BSSID_MAX; i++)
-			if (~mask & BIT(i))
-				return i;
+	case NL80211_IFTYPE_MONITOR:
+	case NL80211_IFTYPE_AP:
+		/* ap uses hw bssid 0 and ext bssid */
+		if (~mask & BIT(HW_BSSID_0))
+			return HW_BSSID_0;
+
+		i = get_free_idx(mask, EXT_BSSID_1, EXT_BSSID_MAX);
+		if (i)
+			return i - 1;
 
 		break;
 	default:
@@ -187,8 +208,8 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 		mvif->wmm_idx = mvif->idx % MT7615_MAX_WMM_SETS;
 
 	dev->mphy.vif_mask |= BIT(mvif->idx);
-	dev->omac_mask |= BIT(mvif->omac_idx);
-	phy->omac_mask |= BIT(mvif->omac_idx);
+	dev->omac_mask |= BIT_ULL(mvif->omac_idx);
+	phy->omac_mask |= BIT_ULL(mvif->omac_idx);
 
 	mt7615_mcu_set_dbdc(dev);
 
@@ -257,8 +278,8 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
 	dev->mphy.vif_mask &= ~BIT(mvif->idx);
-	dev->omac_mask &= ~BIT(mvif->omac_idx);
-	phy->omac_mask &= ~BIT(mvif->omac_idx);
+	dev->omac_mask &= ~BIT_ULL(mvif->omac_idx);
+	phy->omac_mask &= ~BIT_ULL(mvif->omac_idx);
 
 	mt7615_mutex_release(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 28730949dce7..ff64cfbf6ee5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -599,6 +599,42 @@ static int mt7615_mcu_init_download(struct mt7615_dev *dev, u32 addr,
 				 &req, sizeof(req), true);
 }
 
+static int
+mt7615_mcu_muar_config(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       bool bssid, bool enable)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	u32 idx = mvif->omac_idx - REPEATER_BSSID_START;
+	u32 mask = dev->omac_mask >> 32 & ~BIT(idx);
+	const u8 *addr = vif->addr;
+	struct {
+		u8 mode;
+		u8 force_clear;
+		u8 clear_bitmap[8];
+		u8 entry_count;
+		u8 write;
+
+		u8 index;
+		u8 bssid;
+		u8 addr[ETH_ALEN];
+	} __packed req = {
+		.mode = !!mask || enable,
+		.entry_count = 1,
+		.write = 1,
+
+		.index = idx * 2 + bssid,
+	};
+
+	if (bssid)
+		addr = vif->bss_conf.bssid;
+
+	if (enable)
+		ether_addr_copy(req.addr, addr);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_MUAR_UPDATE, &req,
+				 sizeof(req), true);
+}
+
 static int
 mt7615_mcu_add_dev(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		   bool enable)
@@ -634,6 +670,9 @@ mt7615_mcu_add_dev(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		},
 	};
 
+	if (mvif->omac_idx >= REPEATER_BSSID_START)
+		return mt7615_mcu_muar_config(dev, vif, false, enable);
+
 	memcpy(data.tlv.omac_addr, vif->addr, ETH_ALEN);
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_DEV_INFO_UPDATE,
 				 &data, sizeof(data), true);
@@ -1216,6 +1255,9 @@ mt7615_mcu_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	struct mt7615_dev *dev = phy->dev;
 	struct sk_buff *skb;
 
+	if (mvif->omac_idx >= REPEATER_BSSID_START)
+		mt7615_mcu_muar_config(dev, vif, true, enable);
+
 	skb = mt7615_mcu_alloc_sta_req(dev, mvif, NULL);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
@@ -1225,7 +1267,8 @@ mt7615_mcu_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 
 	mt7615_mcu_bss_basic_tlv(skb, vif, sta, enable);
 
-	if (enable && mvif->omac_idx > EXT_BSSID_START)
+	if (enable && mvif->omac_idx >= EXT_BSSID_START &&
+	    mvif->omac_idx < REPEATER_BSSID_START)
 		mt7615_mcu_bss_ext_tlv(skb, mvif);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
@@ -2603,13 +2646,13 @@ int mt7615_mcu_set_dbdc(struct mt7615_dev *dev)
 	} while (0)
 
 	for (i = 0; i < 4; i++) {
-		bool band = !!(ext_phy->omac_mask & BIT(i));
+		bool band = !!(ext_phy->omac_mask & BIT_ULL(i));
 
 		ADD_DBDC_ENTRY(DBDC_TYPE_BSS, i, band);
 	}
 
 	for (i = 0; i < 14; i++) {
-		bool band = !!(ext_phy->omac_mask & BIT(0x11 + i));
+		bool band = !!(ext_phy->omac_mask & BIT_ULL(0x11 + i));
 
 		ADD_DBDC_ENTRY(DBDC_TYPE_MBSS, i, band);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 7b856e9eee1e..17f95df8fd30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -275,6 +275,7 @@ enum {
 	MCU_EXT_CMD_PROTECT_CTRL = 0x3e,
 	MCU_EXT_CMD_DBDC_CTRL = 0x45,
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
+	MCU_EXT_CMD_MUAR_UPDATE = 0x48,
 	MCU_EXT_CMD_BCN_OFFLOAD = 0x49,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index f72506d9f646..496c46f1073e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -11,7 +11,7 @@
 #include "../mt76.h"
 #include "regs.h"
 
-#define MT7615_MAX_INTERFACES		4
+#define MT7615_MAX_INTERFACES		16
 #define MT7615_MAX_WMM_SETS		4
 #define MT7663_WTBL_SIZE		32
 #define MT7615_WTBL_SIZE		128
@@ -176,7 +176,7 @@ struct mt7615_phy {
 	struct ieee80211_vif *monitor_vif;
 
 	u32 rxfilter;
-	u32 omac_mask;
+	u64 omac_mask;
 
 	u16 noise;
 
@@ -346,24 +346,13 @@ enum {
 	HW_BSSID_1,
 	HW_BSSID_2,
 	HW_BSSID_3,
-	HW_BSSID_MAX,
+	HW_BSSID_MAX = HW_BSSID_3,
 	EXT_BSSID_START = 0x10,
 	EXT_BSSID_1,
-	EXT_BSSID_2,
-	EXT_BSSID_3,
-	EXT_BSSID_4,
-	EXT_BSSID_5,
-	EXT_BSSID_6,
-	EXT_BSSID_7,
-	EXT_BSSID_8,
-	EXT_BSSID_9,
-	EXT_BSSID_10,
-	EXT_BSSID_11,
-	EXT_BSSID_12,
-	EXT_BSSID_13,
-	EXT_BSSID_14,
-	EXT_BSSID_15,
-	EXT_BSSID_END
+	EXT_BSSID_15 = 0x1f,
+	EXT_BSSID_MAX = EXT_BSSID_15,
+	REPEATER_BSSID_START = 0x20,
+	REPEATER_BSSID_MAX = 0x3f,
 };
 
 enum {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
