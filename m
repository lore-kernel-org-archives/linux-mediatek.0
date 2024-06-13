Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C94AC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSypuI4+csB/kfi/nwHBZLhLbLNyIXH/lXGa6Of3zO4=; b=1JuWKtGzwOiqPCKb+mPACOXzO8
	SvwTIP4qrcoc1V4mRteoP1jAedBqGsRZ9vn5ayrm4df/tYrELVb3OHnMRxagqUYMq2kZn0wbFTgLT
	GtEQHF6KdaWOcRAAWqm4G4MTwATSS3hxWTzUhmnwB68f//K8KdioCttZxNx13WdbczQhrkBjTfipQ
	CsN4rExNwbtQtmpugNzEiTKFOFjuVU9athB32svA+n1ClzBdXNb+xIz757lN8DcqXf/EuL9lc14Hh
	ReeMpiXwaNmcnnR/dgvoFlUFLPzUIriGIOr94Ae2CoPvGhYm9wADq9NUt/ykof6rcCqHhL23TKUb+
	hupvYIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajx-0000000Eva8-2def;
	Thu, 13 Jun 2024 03:03:05 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajt-0000000EvWT-0035
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:03 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25496e90cf5so70041fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247778; x=1718852578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSypuI4+csB/kfi/nwHBZLhLbLNyIXH/lXGa6Of3zO4=;
        b=VAn7KvwOBDBrhvG+iACBdpn4lrBlvc5EABm0QSM9us2LP5IIU5PxK8ctkqEx5j3zTS
         +8TSzZ1RcqKUE5iZgLZxo/3vbP7lnJ+UM3gDyGc44y4alaqTDxWws677ptTXnRJjMN1k
         G3VXrQa8phW9FDxqUv5TNfKL85Jp6Xe6KY/60vz/NxWReqaQymcEmFVNGNOERV4SpFaX
         CAkBI6INDS/cpqvB+4ADxZtM+tdkFf0/W4LGxh+9lV5PBAgMrhKsDnrMW12WatU74zgN
         OBh3iaGTM/yvYmNvlp+KryLmw64a7RaAGAsXJIwEACt19priVNPhtp6LS8QBIHrXIZul
         ellg==
X-Forwarded-Encrypted: i=1; AJvYcCXxe/mEKD2jAML3m6UAsay/HEucrlI5XAwL63FxaDse+ZjcXNbbsfMLQpg6RyOq2KaVplxjrSW+qQQdzV7mUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4IGoXqYGAljafv68tjovh8zD8YjGHskxPppBI5p0kb4h9tY7
	+VeRykC7B+BhVjvwOmgKx3nPBFjXOvYZXMVZZ3YC3nMuIwcAM/IR
X-Google-Smtp-Source: AGHT+IEKah+J8c/h93DZRB0D9q1CdSrxG9zXcATvCRSvT1+vntCbU71Uc6a/3IEC3f2hU2EaOJ8DJw==
X-Received: by 2002:a05:6820:b0b:b0:5ba:c4ed:ee98 with SMTP id 006d021491bc7-5bb3b7a4c51mr3589055eaf.0.1718247778215;
        Wed, 12 Jun 2024 20:02:58 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:02:56 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/47] wifi: mt76: mt792x: extend mt76_connac_mcu_uni_add_dev for per-link BSS
Date: Wed, 12 Jun 2024 20:01:59 -0700
Message-Id: <20240613030241.5771-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200301_096225_4D5DAFA7 
X-CRM114-Status: GOOD (  16.80  )
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

From: Sean Wang <sean.wang@mediatek.com>

Extend mt76_connac_mcu_uni_add_dev with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

We also extend link_idx field in mt76_connac_bss_basic_tlv for the firmware
to able to identify the link index in the MLO mode that is not harmful
for the current non-MLO mode.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 12 +++++++-----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c     |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c     |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x_core.c     |  2 +-
 8 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c807bd8d928d..792ae41f7c69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1109,8 +1109,8 @@ mt7615_mcu_uni_add_dev(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 
-	return mt76_connac_mcu_uni_add_dev(phy->mt76, vif, &mvif->sta.wcid,
-					   enable);
+	return mt76_connac_mcu_uni_add_dev(phy->mt76, &vif->bss_conf,
+					   &mvif->sta.wcid, enable);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fb8bd50eb7de..87f918461051 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1125,11 +1125,11 @@ void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_ba_tlv);
 
 int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
-				struct ieee80211_vif *vif,
+				struct ieee80211_bss_conf *bss_conf,
 				struct mt76_wcid *wcid,
 				bool enable)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt76_vif *mvif = (struct mt76_vif *)bss_conf->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
 	struct {
 		struct {
@@ -1141,7 +1141,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			__le16 tag;
 			__le16 len;
 			u8 active;
-			u8 pad;
+			u8 link_idx; /* not link_id */
 			u8 omac_addr[ETH_ALEN];
 		} __packed tlv;
 	} dev_req = {
@@ -1153,6 +1153,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
 			.len = cpu_to_le16(sizeof(struct req_tlv)),
 			.active = enable,
+			.link_idx = mvif->idx,
 		},
 	};
 	struct {
@@ -1175,12 +1176,13 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.bmc_tx_wlan_idx = cpu_to_le16(wcid->idx),
 			.sta_idx = cpu_to_le16(wcid->idx),
 			.conn_state = 1,
+			.link_idx = mvif->idx,
 		},
 	};
 	int err, idx, cmd, len;
 	void *data;
 
-	switch (vif->type) {
+	switch (bss_conf->vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_MONITOR:
 	case NL80211_IFTYPE_AP:
@@ -1200,7 +1202,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
 	basic_req.basic.hw_bss_idx = idx;
 
-	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+	memcpy(dev_req.tlv.omac_addr, bss_conf->vif->addr, ETH_ALEN);
 
 	cmd = enable ? MCU_UNI_CMD(DEV_INFO_UPDATE) : MCU_UNI_CMD(BSS_INFO_UPDATE);
 	data = enable ? (void *)&dev_req : (void *)&basic_req;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 4d83ec2a0f9a..e6e8824c828e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1436,7 +1436,7 @@ struct mt76_connac_bss_basic_tlv {
 	__le16 sta_idx;
 	__le16 nonht_basic_phy;
 	u8 phymode_ext; /* bit(0) AX_6G */
-	u8 pad[1];
+	u8 link_idx;
 } __packed;
 
 struct mt76_connac_bss_qos_tlv {
@@ -1910,7 +1910,7 @@ void mt76_connac_mcu_sta_ba_tlv(struct sk_buff *skb,
 				struct ieee80211_ampdu_params *params,
 				bool enable, bool tx);
 int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
-				struct ieee80211_vif *vif,
+				struct ieee80211_bss_conf *bss_conf,
 				struct mt76_wcid *wcid,
 				bool enable);
 int mt76_connac_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 5ea01c39e2e1..101cac747f9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -646,7 +646,8 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
 
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.deflink.wcid, true);
+	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+				    &mvif->sta.deflink.wcid, true);
 	mt7921_mcu_set_tx(dev, vif);
 
 	if (vif->type == NL80211_IFTYPE_AP) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 89d47cce9e8b..c7e71043c257 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -306,8 +306,8 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->bss_conf.mt76.band_idx = 0;
 	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.deflink.wcid,
-					  true);
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+					  &mvif->sta.deflink.wcid, true);
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 88e7b2ff4593..48425fc4e7fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1243,7 +1243,8 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
 
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.deflink.wcid, true);
+	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+				    &mvif->sta.deflink.wcid, true);
 	mt7925_mcu_set_tx(dev, vif);
 
 	if (vif->type == NL80211_IFTYPE_AP) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 397776ddf01a..b0c8b090d2ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -344,8 +344,8 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	else
 		mvif->bss_conf.mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.deflink.wcid,
-					  true);
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+					  &mvif->sta.deflink.wcid, true);
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index a189ae38f2d0..222204916b73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -124,7 +124,7 @@ void mt792x_remove_interface(struct ieee80211_hw *hw,
 
 	mt792x_mutex_acquire(dev);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.deflink.wcid, false);
+	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf, &mvif->sta.deflink.wcid, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-- 
2.34.1


