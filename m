Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605D7C2D0F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3ED206D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+yDu3dQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="13o8paQd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3ED206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBUiSECck5b9w0KGQrW9jI/EwtgF3xxTbpWYXkrkemA=; b=t+yDu3dQjLccBB
	X3O/NeBU+wJSsv4J0hMdPPUb9BQIBj/wEarpxDIDtEAmuLoGRAhFUeapHnDj50UTnOBQSSlXUgu2B
	KLnwzG+WifRtmGVENCoBSq533Q2ueKkqQ8wlDHBe0mb9c5pXAg2rtT6FVNRZGqZlSsbI5mbNyWuHa
	BNHMw+YVujIXgKR38nx/WB+Z7307kv0naF786H9ssh8Jqn0IKINrJ9CC70eQtiho6RdRsx54DkrcG
	V3myfzqy7JKqLLH2MT2Ch0zJG5m3uotE8tEnigZ9w8+qkrGyFgz73OYubB5uQdB55LUlCRd2aq2sh
	qUQ8K2yfLyLBRmxsYp7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYb7L-0002EJ-Ck; Tue, 12 May 2020 20:03:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYb7I-0002B2-Kf
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 20:03:06 +0000
Received: from localhost.localdomain.com (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29A2B20753;
 Tue, 12 May 2020 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589313784;
 bh=kXKyWrl0IYZIsY/wy0LBJH7I5PyxDo46065KM5XDZ+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=13o8paQdknW2dDsvzMhcwunHDqCftOs9EQ1NemBCfryxt8ElNEXMiQz8EusjEyJjC
 sxsWcBMCQCCZCq/LhPEfKYUFnh8FGF5kSdmgLrr63I0NkUk9+GA5HEarc/3ENGLIdW
 o2asgpQ69veGa1ubidBroQvD5GN1wZ5IHTdDIrgw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 3/4] mt76: enable p2p support
Date: Tue, 12 May 2020 22:02:49 +0200
Message-Id: <33ea6a979805728f1f713f387627832fb1399aae.1589313659.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589313659.git.lorenzo@kernel.org>
References: <cover.1589313659.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_130304_711241_F39E76FB 
X-CRM114-Status: GOOD (  13.67  )
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

Introduce p2p-go/p2p-client suppor to mt76 driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |  2 +
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  6 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  3 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 61 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +
 .../net/wireless/mediatek/mt76/mt76x02_util.c |  4 ++
 8 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 21407704f1b3..907098101898 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -313,6 +313,8 @@ mt76_phy_init(struct mt76_dev *dev, struct ieee80211_hw *hw)
 #ifdef CONFIG_MAC80211_MESH
 		BIT(NL80211_IFTYPE_MESH_POINT) |
 #endif
+		BIT(NL80211_IFTYPE_P2P_CLIENT) |
+		BIT(NL80211_IFTYPE_P2P_GO) |
 		BIT(NL80211_IFTYPE_ADHOC);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index f641a8b56b39..94196599797e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -342,6 +342,8 @@ static const struct ieee80211_iface_limit if_limits[] = {
 #ifdef CONFIG_MAC80211_MESH
 			 BIT(NL80211_IFTYPE_MESH_POINT) |
 #endif
+			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			 BIT(NL80211_IFTYPE_P2P_GO) |
 			 BIT(NL80211_IFTYPE_AP)
 	 },
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 6e1a17f08f5e..b5bbe9f5f7dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -140,7 +140,9 @@ void mt7615_check_offload_capability(struct mt7615_dev *dev)
 		ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 
 		wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
-				   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
+				   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR |
+				   NL80211_FEATURE_P2P_GO_CTWIN |
+				   NL80211_FEATURE_P2P_GO_OPPPS;
 	} else {
 		dev->ops->hw_scan = NULL;
 		dev->ops->cancel_hw_scan = NULL;
@@ -205,6 +207,8 @@ static const struct ieee80211_iface_limit if_limits[] = {
 #ifdef CONFIG_MAC80211_MESH
 			 BIT(NL80211_IFTYPE_MESH_POINT) |
 #endif
+			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			 BIT(NL80211_IFTYPE_P2P_GO) |
 			 BIT(NL80211_IFTYPE_STATION)
 	}
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index c8705f91bafc..e87a5843c718 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -503,6 +503,9 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
 		mt7615_mcu_add_bss_info(phy, vif, NULL, info->enable_beacon);
 		mt7615_mcu_sta_add(dev, vif, NULL, info->enable_beacon);
+
+		if (vif->p2p && info->enable_beacon)
+			mt7615_mcu_set_p2p_oppps(hw, vif);
 	}
 
 	if (changed & (BSS_CHANGED_BEACON |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index e9ae7e94d8fd..92ea9dc3c1c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -695,9 +695,9 @@ mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	u32 type = vif->p2p ? NETWORK_P2P : NETWORK_INFRA;
 	struct bss_info_basic *bss;
 	u8 wlan_idx = mvif->sta.wcid.idx;
-	u32 type = NETWORK_INFRA;
 	struct tlv *tlv;
 
 	tlv = mt7615_mcu_add_tlv(skb, BSS_INFO_BASIC, sizeof(*bss));
@@ -749,10 +749,16 @@ mt7615_mcu_bss_omac_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		type = CONNECTION_INFRA_AP;
+		if (vif->p2p)
+			type = CONNECTION_P2P_GO;
+		else
+			type = CONNECTION_INFRA_AP;
 		break;
 	case NL80211_IFTYPE_STATION:
-		type = CONNECTION_INFRA_STA;
+		if (vif->p2p)
+			type = CONNECTION_P2P_GC;
+		else
+			type = CONNECTION_INFRA_STA;
 		break;
 	case NL80211_IFTYPE_ADHOC:
 		type = CONNECTION_IBSS_ADHOC;
@@ -815,6 +821,7 @@ mt7615_mcu_sta_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 {
 	struct sta_rec_basic *basic;
 	struct tlv *tlv;
+	int conn_type;
 
 	tlv = mt7615_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic));
 
@@ -837,11 +844,19 @@ mt7615_mcu_sta_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
+		if (vif->p2p)
+			conn_type = CONNECTION_P2P_GC;
+		else
+			conn_type = CONNECTION_INFRA_STA;
+		basic->conn_type = cpu_to_le32(conn_type);
 		basic->aid = cpu_to_le16(sta->aid);
 		break;
 	case NL80211_IFTYPE_STATION:
-		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
+		if (vif->p2p)
+			conn_type = CONNECTION_P2P_GO;
+		else
+			conn_type = CONNECTION_INFRA_AP;
+		basic->conn_type = cpu_to_le32(conn_type);
 		basic->aid = cpu_to_le16(vif->bss_conf.aid);
 		break;
 	case NL80211_IFTYPE_ADHOC:
@@ -1403,7 +1418,7 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 			.short_st = true,
 		},
 	};
-	int err;
+	int err, conn_type;
 	u8 idx;
 
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
@@ -1412,10 +1427,18 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
+		if (vif->p2p)
+			conn_type = CONNECTION_P2P_GO;
+		else
+			conn_type = CONNECTION_INFRA_AP;
+		basic_req.basic.conn_type = cpu_to_le32(conn_type);
 		break;
 	case NL80211_IFTYPE_STATION:
-		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
+		if (vif->p2p)
+			conn_type = CONNECTION_P2P_GC;
+		else
+			conn_type = CONNECTION_INFRA_STA;
+		basic_req.basic.conn_type = cpu_to_le32(conn_type);
 		break;
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
@@ -3550,3 +3573,25 @@ int mt7615_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
 				       MCU_UNI_CMD_OFFLOAD, true);
 }
 #endif /* CONFIG_PM */
+
+int mt7615_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
+			     struct ieee80211_vif *vif)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	int ct_window = vif->bss_conf.p2p_noa_attr.oppps_ctwindow;
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct {
+		__le32 ct_win;
+		u8 bss_idx;
+		u8 rsv[3];
+	} __packed req = {
+		.ct_win = cpu_to_le32(ct_window),
+		.bss_idx = mvif->idx,
+	};
+
+	if (!mt7615_firmware_offload(dev))
+		return -ENOTSUPP;
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_P2P_OPPPS,
+				   &req, sizeof(req), false);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 0f12e6da89af..338fd077f575 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -507,6 +507,7 @@ enum {
 	MCU_CMD_SET_BSS_CONNECTED = MCU_CE_PREFIX | 0x16,
 	MCU_CMD_SET_BSS_ABORT = MCU_CE_PREFIX | 0x17,
 	MCU_CMD_CANCEL_HW_SCAN = MCU_CE_PREFIX | 0x1b,
+	MCU_CMD_SET_P2P_OPPPS = MCU_CE_PREFIX | 0x33,
 	MCU_CMD_SCHED_SCAN_ENABLE = MCU_CE_PREFIX | 0x61,
 	MCU_CMD_SCHED_SCAN_REQ = MCU_CE_PREFIX | 0x62,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index dc60abb0a130..ebdfca64b079 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -530,6 +530,8 @@ int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy);
 void m7615_mcu_set_ps_iter(void *priv, u8 *mac, struct ieee80211_vif *vif);
 int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy);
 
+int mt7615_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
+			     struct ieee80211_vif *vif);
 int mt7615_firmware_own(struct mt7615_dev *dev);
 int mt7615_driver_own(struct mt7615_dev *dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index b7a120b0856d..9a2c9afa2fb5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -46,6 +46,8 @@ static const struct ieee80211_iface_limit mt76x02_if_limits[] = {
 #ifdef CONFIG_MAC80211_MESH
 			 BIT(NL80211_IFTYPE_MESH_POINT) |
 #endif
+			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			 BIT(NL80211_IFTYPE_P2P_GO) |
 			 BIT(NL80211_IFTYPE_AP)
 	 },
 };
@@ -60,6 +62,8 @@ static const struct ieee80211_iface_limit mt76x02u_if_limits[] = {
 #ifdef CONFIG_MAC80211_MESH
 			 BIT(NL80211_IFTYPE_MESH_POINT) |
 #endif
+			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			 BIT(NL80211_IFTYPE_P2P_GO) |
 			 BIT(NL80211_IFTYPE_AP)
 	},
 };
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
