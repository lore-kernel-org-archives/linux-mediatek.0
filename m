Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B9AC27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTbknuCcxBFM/pXAboNibD22DPmvjD+qglC+dC8qFos=; b=CkMHXAX8+/BClakFCEhxBGfWe1
	EbIVjojr0ZZjRnWAOdl71wDdWmj+Fma0p5hWm50u5f78sk/C8Fy7zTBCiFwxT77nGuqTAChkUMHPr
	ctG/CyaviHzGy54/A6OgbeO1vHzGogr9+3nuAw2WuqlMhmdbL2qyisjBm1oT2UxpPXV6X0LXyt5PQ
	h7PkfTJxW0+GWAzDMPK5FyHdeQRlwGDyiiV/W58s0Fi/YNA090oCTmDJgNw0sw8twUQGzDLyGV8Ta
	cwfwedgyA2ucdVPZL/kbAZ6+jvaYcEA8E7C8v59HKBIqun1cUf20QOoEmUA4Y4F/sNtATbCo1VjWZ
	t7bBwh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajy-0000000Evag-0LKI;
	Thu, 13 Jun 2024 03:03:06 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajs-0000000EvVI-2j5V
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:03 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25496e90cf5so70031fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247776; x=1718852576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTbknuCcxBFM/pXAboNibD22DPmvjD+qglC+dC8qFos=;
        b=poVE8Y7ilBJoxTqoo33A+SNQ1Bk1rrTFZq/Y7D1FPj2L5vtAo6mVF8R9Z9SMA+NDuc
         LS9Sb7hs9P0EgoVOOdFd2zlb3YuxFuEuk6ZoCKVShoUCP/X+gNgrPyzJuenKn4TH0lU0
         VWmA2o2yiIwPFsg5+qpukTHAm/6+AoAh/frhlkc8ltbdh8wTcRLin0x7ywvxQwiVzfjC
         FCbJGN9hvNunwiyWoawjjgZY98xYcwVuc3rJ1WzMowsrg7SSo0MEBgQZRGczEDKY/n3/
         o7YrzDxN20FGL7ZDWY/KgYZwAsATWwrb6rU4m8rv4RKVDL+dat/sUxJUOxA5Z89VDLRu
         Eg/w==
X-Forwarded-Encrypted: i=1; AJvYcCW3CxseDGqIA6pk4tQgQBkjq02xdtLUR0Nvm0Za4LL8ZzT0kR47o/ZE6NmUaRey+2dPObYYT89gGE/0ND4jiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYXX3jJbHNig8OIpPcD6QyBDrP/ltlxVsy8BV9p8gCfoKKFeW6
	pd81ogfiE/ngqtL9ggL+e1EWzioHmF/z/sS6ojL5G2d/9eFGKL+0T3VupSy19pU=
X-Google-Smtp-Source: AGHT+IFXaJzQHaYoUlzxItiYvtpBTUQMFf3XYeOAf7nO9GCdpTZw/Q9Zwh7hHRn5kHY1RrUgGCKcaQ==
X-Received: by 2002:a05:6820:2c86:b0:5aa:3e4f:f01e with SMTP id 006d021491bc7-5bb3b9c614cmr3867601eaf.1.1718247775640;
        Wed, 12 Jun 2024 20:02:55 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:02:54 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 04/47] wifi: mt76: mt7925: support for split bss_info_changed method
Date: Wed, 12 Jun 2024 20:01:58 -0700
Message-Id: <20240613030241.5771-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200300_808112_C2C67A86 
X-CRM114-Status: GOOD (  14.16  )
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

The .bss_info_changed method is being split into .vif_cfg_changed and
.link_info_changed to support MLD devices, but it will still support
non-MLD devices.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 132 ++++++++++--------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |   7 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   3 +-
 3 files changed, 76 insertions(+), 66 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 91edbe076c22..397776ddf01a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -695,65 +695,6 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
-static void mt7925_bss_info_changed(struct ieee80211_hw *hw,
-				    struct ieee80211_vif *vif,
-				    struct ieee80211_bss_conf *info,
-				    u64 changed)
-{
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
-	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-
-	mt792x_mutex_acquire(dev);
-
-	if (changed & BSS_CHANGED_ERP_SLOT) {
-		int slottime = info->use_short_slot ? 9 : 20;
-
-		if (slottime != phy->slottime) {
-			phy->slottime = slottime;
-			mt7925_mcu_set_timing(phy, vif);
-		}
-	}
-
-	if (changed & BSS_CHANGED_MCAST_RATE)
-		mvif->mcast_rates_idx =
-				mt7925_get_rates_table(hw, vif, false, true);
-
-	if (changed & BSS_CHANGED_BASIC_RATES)
-		mvif->basic_rates_idx =
-				mt7925_get_rates_table(hw, vif, false, false);
-
-	if (changed & (BSS_CHANGED_BEACON |
-		       BSS_CHANGED_BEACON_ENABLED)) {
-		mvif->beacon_rates_idx =
-				mt7925_get_rates_table(hw, vif, true, false);
-
-		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif,
-						  info->enable_beacon);
-	}
-
-	/* ensure that enable txcmd_mode after bss_info */
-	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
-		mt7925_mcu_set_tx(dev, vif);
-
-	if (changed & BSS_CHANGED_PS)
-		mt7925_mcu_uni_bss_ps(dev, vif);
-
-	if (changed & BSS_CHANGED_ASSOC) {
-		mt7925_mcu_sta_update(dev, NULL, vif, true,
-				      MT76_STA_INFO_STATE_ASSOC);
-		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
-	}
-
-	if (changed & BSS_CHANGED_ARP_FILTER) {
-		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-
-		mt7925_mcu_update_arp_filter(&dev->mt76, &mvif->bss_conf.mt76, info);
-	}
-
-	mt792x_mutex_release(dev);
-}
-
 int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
@@ -1404,6 +1345,76 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 	mt7925_abort_roc(mvif->phy, mvif);
 }
 
+static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   u64 changed)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+
+	mt792x_mutex_acquire(dev);
+
+	if (changed & BSS_CHANGED_ASSOC) {
+		mt7925_mcu_sta_update(dev, NULL, vif, true,
+				      MT76_STA_INFO_STATE_ASSOC);
+		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
+	}
+
+	if (changed & BSS_CHANGED_ARP_FILTER) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+		mt7925_mcu_update_arp_filter(&dev->mt76, &mvif->bss_conf.mt76);
+	}
+
+	if (changed & BSS_CHANGED_PS)
+		mt7925_mcu_uni_bss_ps(dev, vif);
+
+	mt792x_mutex_release(dev);
+}
+
+static void mt7925_link_info_changed(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     struct ieee80211_bss_conf *info,
+				     u64 changed)
+{
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+
+	mt792x_mutex_acquire(dev);
+
+	if (changed & BSS_CHANGED_ERP_SLOT) {
+		int slottime = info->use_short_slot ? 9 : 20;
+
+		if (slottime != phy->slottime) {
+			phy->slottime = slottime;
+			mt7925_mcu_set_timing(phy, vif);
+		}
+	}
+
+	if (changed & BSS_CHANGED_MCAST_RATE)
+		mvif->mcast_rates_idx =
+				mt7925_get_rates_table(hw, vif, false, true);
+
+	if (changed & BSS_CHANGED_BASIC_RATES)
+		mvif->basic_rates_idx =
+				mt7925_get_rates_table(hw, vif, false, false);
+
+	if (changed & (BSS_CHANGED_BEACON |
+		       BSS_CHANGED_BEACON_ENABLED)) {
+		mvif->beacon_rates_idx =
+				mt7925_get_rates_table(hw, vif, true, false);
+
+		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif,
+						  info->enable_beacon);
+	}
+
+	/* ensure that enable txcmd_mode after bss_info */
+	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
+		mt7925_mcu_set_tx(dev, vif);
+
+	mt792x_mutex_release(dev);
+}
+
 const struct ieee80211_ops mt7925_ops = {
 	.tx = mt792x_tx,
 	.start = mt7925_start,
@@ -1413,7 +1424,6 @@ const struct ieee80211_ops mt7925_ops = {
 	.config = mt7925_config,
 	.conf_tx = mt7925_conf_tx,
 	.configure_filter = mt7925_configure_filter,
-	.bss_info_changed = mt7925_bss_info_changed,
 	.start_ap = mt7925_start_ap,
 	.stop_ap = mt7925_stop_ap,
 	.sta_state = mt76_sta_state,
@@ -1461,6 +1471,8 @@ const struct ieee80211_ops mt7925_ops = {
 	.unassign_vif_chanctx = mt792x_unassign_vif_chanctx,
 	.mgd_prepare_tx = mt7925_mgd_prepare_tx,
 	.mgd_complete_tx = mt7925_mgd_complete_tx,
+	.vif_cfg_changed = mt7925_vif_cfg_changed,
+	.link_info_changed = mt7925_link_info_changed,
 };
 EXPORT_SYMBOL_GPL(mt7925_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 67c05f785190..5e72f7278e8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -121,11 +121,10 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 EXPORT_SYMBOL_GPL(mt7925_mcu_regval);
 
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
-				 struct mt76_vif *vif,
-				 struct ieee80211_bss_conf *info)
+				 struct mt76_vif *vif)
 {
-	struct ieee80211_vif *mvif = container_of(info, struct ieee80211_vif,
-						  bss_conf);
+	struct ieee80211_vif *mvif = container_of((void *)vif, struct ieee80211_vif,
+						  drv_priv);
 	struct sk_buff *skb;
 	int i, len = min_t(int, mvif->cfg.arp_addr_cnt,
 			   IEEE80211_BSS_ARP_ADDR_LIST_LEN);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index b8315a89f4a9..b499b1d0531a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -590,6 +590,5 @@ int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 			 struct ieee80211_chanctx_conf *ctx);
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
-				 struct mt76_vif *vif,
-				 struct ieee80211_bss_conf *info);
+				 struct mt76_vif *vif);
 #endif
-- 
2.34.1


