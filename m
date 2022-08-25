Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65427C00448
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SpTyrzPfvhgrnUAG41diDhSK+1EnANAou6LsjSzD3h4=; b=QEkgj0CmbDx38Z1+lUKrHSdpEn
	T3u8BJLyz23Hx5exIVgH0jObbeCyjjrhY5t2nWyxObsiYwjh+TBWh0RriQrxjdB205WI/jMG9qdce
	xAKVKnLtMsA9hcIpwLbwGq2SKKl1pE2/Cj+zM+6AzXi6zvjWLl5hsh9Lke2y9P2FZqzGZ6X2c3Etg
	GxdpaF8UX7mLR3vZqJxcqsGUVKJ13uYEp4ZLUvUrs2VUwNLEI4QvP67a0WP2pu3O2jQx52V9bgx5I
	rBpsrAn4TcBUENvns37iQRmTmVby/Qoa0LwNwXjLm7iVA49POCQ7cWimQha80fXd82Weuh4WLMA6D
	lCn7ECFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3XJ-005JLB-Kr; Thu, 25 Aug 2022 03:28:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3XG-005JJL-VO
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 03:28:04 +0000
X-UUID: 9abb34e6f3b249d2b46f2e6365308663-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SpTyrzPfvhgrnUAG41diDhSK+1EnANAou6LsjSzD3h4=;
	b=Fr6Zq2lhoMULxarma6m2kDVIhZVKg7POOtQ8P9DnBQkv9WwWMTw+K4e7RyO0ZvXNd/Eypz67u6HjAG4425a109bP9IToakmqvHRy2K6eOh2k1Cb6G5DdumsfxJZ1DL5i/0DaIYTY9IFr+nDzxJKubj8ngRWeQVZn3DZ7sDg40kw=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:7775f847-e521-470e-bb07-a6ec8ab76897,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10,REQID:7775f847-e521-470e-bb07-a6ec8ab76897,OB:0,LOB
	:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
	81B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18,CLOUDID:1b478acf-20bd-4e5e-ace8-00692b7ab380,C
	OID:f17c7347f493,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9abb34e6f3b249d2b46f2e6365308663-20220824
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 673359271; Wed, 24 Aug 2022 20:27:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 25 Aug 2022 11:27:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 25 Aug 2022 11:27:24 +0800
From: <sean.wang@mediatek.com>
To: <stable@vger.kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Deren Wu <deren.wu@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 5.19] mt76: mt7921: fix command timeout in AP stop period
Date: Thu, 25 Aug 2022 11:27:22 +0800
Message-ID: <94065c608ee60d8a96a3d91913cb1e28d0a302e1.1661397440.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_202803_047977_9FC6015D 
X-CRM114-Status: GOOD (  14.75  )
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

From: Deren Wu <deren.wu@mediatek.com>

commit 9d958b60ebc2434f2b7eae83d77849e22d1059eb upstream.

Due to AP stop improperly, mt7921 driver would face random command timeout
by chip fw problem. Migrate AP start/stop process to .start_ap/.stop_ap and
congiure BSS network settings in both hooks.

The new flow is shown below.
* AP start
    .start_ap()
      configure BSS network resource
      set BSS to connected state
    .bss_info_changed()
      enable fw beacon offload

* AP stop
    .bss_info_changed()
      disable fw beacon offload (skip this command)
    .stop_ap()
      set BSS to disconnected state (beacon offload disabled automatically)
      destroy BSS network resource

Fixes: 116c69603b01 ("mt76: mt7921: Add AP mode support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 47 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  5 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 4 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index faa279bbbcb2..7eb23805aa94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1403,6 +1403,8 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 		else
 			conn_type = CONNECTION_INFRA_AP;
 		basic_req.basic.conn_type = cpu_to_le32(conn_type);
+		/* Fully active/deactivate BSS network in AP mode only */
+		basic_req.basic.active = enable;
 		break;
 	case NL80211_IFTYPE_STATION:
 		if (vif->p2p)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index e86fe9ee4623..d3f310877248 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -653,15 +653,6 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
-		struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-
-		mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
-					    true);
-		mt7921_mcu_sta_update(dev, NULL, vif, true,
-				      MT76_STA_INFO_STATE_NONE);
-	}
-
 	if (changed & (BSS_CHANGED_BEACON |
 		       BSS_CHANGED_BEACON_ENABLED))
 		mt7921_mcu_uni_add_beacon_offload(dev, hw, vif,
@@ -1500,6 +1491,42 @@ mt7921_channel_switch_beacon(struct ieee80211_hw *hw,
 	mt7921_mutex_release(dev);
 }
 
+static int
+mt7921_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	int err;
+
+	err = mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
+					  true);
+	if (err)
+		return err;
+
+	err = mt7921_mcu_set_bss_pm(dev, vif, true);
+	if (err)
+		return err;
+
+	return mt7921_mcu_sta_update(dev, NULL, vif, true,
+				     MT76_STA_INFO_STATE_NONE);
+}
+
+static void
+mt7921_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	int err;
+
+	err = mt7921_mcu_set_bss_pm(dev, vif, false);
+	if (err)
+		return;
+
+	mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false);
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1510,6 +1537,8 @@ const struct ieee80211_ops mt7921_ops = {
 	.conf_tx = mt7921_conf_tx,
 	.configure_filter = mt7921_configure_filter,
 	.bss_info_changed = mt7921_bss_info_changed,
+	.start_ap = mt7921_start_ap,
+	.stop_ap = mt7921_stop_ap,
 	.sta_state = mt7921_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.set_key = mt7921_set_key,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 613a94be8ea4..6d0aceb5226a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1020,7 +1020,7 @@ mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 				 &bcnft_req, sizeof(bcnft_req), true);
 }
 
-static int
+int
 mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 		      bool enable)
 {
@@ -1049,9 +1049,6 @@ mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 	};
 	int err;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return 0;
-
 	err = mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(SET_BSS_ABORT),
 				&req_hdr, sizeof(req_hdr), false);
 	if (err < 0 || !enable)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 66054123bcc4..cebc3cfa01b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -280,6 +280,8 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force);
 int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev);
 void mt7921_dma_cleanup(struct mt7921_dev *dev);
 int mt7921_run_firmware(struct mt7921_dev *dev);
+int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			  bool enable);
 int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 			  struct ieee80211_vif *vif, bool enable,
 			  enum mt76_sta_info_state state);
-- 
2.25.1


