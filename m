Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF36C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nvb5AJFmYUTVY3+9AzIQTo1J8qEy+Vm/mbwCjCAQx2E=; b=UH24iYoI6ESWe8jQwgfWrRTOTY
	0Lg0zEE8qHG5FS64kmkNOUmJBURzkYG9S0OCMCbETjbLrXNoP+O+7HeQjFXhl8jLWfroC58VCF/Xh
	MnIilqJ0SfgOdWNCsOy+nc4rkU2pca1Ve5y1wNr5kSSQEZgk11uVHbXwwFpm2QJ5fWDq2Iad4p4hf
	hjfIAAqRbnWK7aeUFlPdU+lNISzlR9mfW4uoHu+KjpcBznDWDOYcM9V8K+w7VL9B9MF7RYI8UOV4P
	xt9zLB6HfqXQgMpL8JAfXnMaA0Lb344+/tZv5HO6VtO8G9JtNUK9xcyu1UsWFJ+Te9bylSHZwSVh/
	/GNZ5HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajr-0000000EvWZ-1IIg;
	Thu, 13 Jun 2024 03:02:59 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajn-0000000EvUG-0Juw
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:02:57 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5bad4e45863so24355eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247774; x=1718852574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nvb5AJFmYUTVY3+9AzIQTo1J8qEy+Vm/mbwCjCAQx2E=;
        b=iu2n8FFevimvkelTUyBIV2k8NxXTNZEp4FUvIvuKZICLAPZgD43ATMY84V11nuU+a/
         5qe6Iz1j1JVPpSgtR3xlNFDjqU5X7VjPESAZexwSAHa5hLXArzzqGzu92ADVcYZvC9ID
         dQ2rbGdzwjhfp5JfqOu/viz3XjaZFOz9NJ9tnxBhCwwIvQrOn8cNQxrgsWg1lN1/p3ey
         sNL8pmZjE26ZGV7xwjjv4Y6BdDJn8cTdNMtRILTO8ykSuzHdWZaSTcFX82h5QFMucYau
         EdfT2feaqKwDJUQhRZEwX8y24gxasDouvKrXpK3ZUDwJpZXViwVhvLSLWWR+LYGqMfcu
         vsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUeR3o6ndN1ESGOhKuTa863+6Hxq8CEuXuo3bKr5osqGMcrFi7ivQXhBjZJqxTERc4XPx0ItECrETEAEkanWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0IX7ONSDnY25mOounlUQTYohkXaLjy4Y5YJ3iEkttFfbn8Da
	uJ8sUGJ/bHO7qPg0SLt/3YzqV/rOI6BPQRZpXaxnYlKHG18/WLxsfB2yV/QhzP4=
X-Google-Smtp-Source: AGHT+IHzWVQJdCK0UMaB6vy18L88HksO71wTbhM59p53AnVFBNdYc8aDnqYc1k+Ee4AqA8mHWuc+ng==
X-Received: by 2002:a05:6820:2c86:b0:5aa:3e4f:f01e with SMTP id 006d021491bc7-5bb3b9c614cmr3867544eaf.1.1718247773727;
        Wed, 12 Jun 2024 20:02:53 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:02:51 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 03/47] wifi: mt76: mt792x: add struct mt792x_chanctx
Date: Wed, 12 Jun 2024 20:01:57 -0700
Message-Id: <20240613030241.5771-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200255_196158_83983FB1 
X-CRM114-Status: GOOD (  14.36  )
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

We are introducing a new structure, mt792x_chanctx, to quickly identify
the linked BSS it is working on. This eliminates the need to search in
mt7921_ctx_iter() or mt7925_ctx_iter() when the channel context changes.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 31 ++++++++-----------
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 31 ++++++++-----------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  4 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  5 +++
 4 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3141807ec54b..89d47cce9e8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1346,32 +1346,27 @@ mt7921_remove_chanctx(struct ieee80211_hw *hw,
 {
 }
 
-static void mt7921_ctx_iter(void *priv, u8 *mac,
-			    struct ieee80211_vif *vif)
-{
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct ieee80211_chanctx_conf *ctx = priv;
-
-	if (ctx != mvif->bss_conf.mt76.ctx)
-		return;
-
-	if (vif->type == NL80211_IFTYPE_MONITOR)
-		mt7921_mcu_config_sniffer(mvif, ctx);
-	else
-		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
-}
-
 static void
 mt7921_change_chanctx(struct ieee80211_hw *hw,
 		      struct ieee80211_chanctx_conf *ctx,
 		      u32 changed)
 {
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct ieee80211_vif *vif;
+	struct mt792x_vif *mvif;
+
+	if (!mctx->bss_conf)
+		return;
+
+	mvif = container_of(mctx->bss_conf, struct mt792x_vif, bss_conf);
+	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
 	mt792x_mutex_acquire(phy->dev);
-	ieee80211_iterate_active_interfaces(phy->mt76->hw,
-					    IEEE80211_IFACE_ITER_ACTIVE,
-					    mt7921_ctx_iter, ctx);
+	if (vif->type == NL80211_IFTYPE_MONITOR)
+		mt7921_mcu_config_sniffer(mvif, ctx);
+	else
+		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
 	mt792x_mutex_release(phy->dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 504c2ecc3845..91edbe076c22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1354,34 +1354,29 @@ mt7925_remove_chanctx(struct ieee80211_hw *hw,
 {
 }
 
-static void mt7925_ctx_iter(void *priv, u8 *mac,
-			    struct ieee80211_vif *vif)
+static void
+mt7925_change_chanctx(struct ieee80211_hw *hw,
+		      struct ieee80211_chanctx_conf *ctx,
+		      u32 changed)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct ieee80211_chanctx_conf *ctx = priv;
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct ieee80211_vif *vif;
+	struct mt792x_vif *mvif;
 
-	if (ctx != mvif->bss_conf.mt76.ctx)
+	if (!mctx->bss_conf)
 		return;
 
+	mvif = container_of(mctx->bss_conf, struct mt792x_vif, bss_conf);
+	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
+
+	mt792x_mutex_acquire(phy->dev);
 	if (vif->type == NL80211_IFTYPE_MONITOR) {
 		mt7925_mcu_set_sniffer(mvif->phy->dev, vif, true);
 		mt7925_mcu_config_sniffer(mvif, ctx);
 	} else {
 		mt7925_mcu_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
 	}
-}
-
-static void
-mt7925_change_chanctx(struct ieee80211_hw *hw,
-		      struct ieee80211_chanctx_conf *ctx,
-		      u32 changed)
-{
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
-
-	mt792x_mutex_acquire(phy->dev);
-	ieee80211_iterate_active_interfaces(phy->mt76->hw,
-					    IEEE80211_IFACE_ITER_ACTIVE,
-					    mt7925_ctx_iter, ctx);
 	mt792x_mutex_release(phy->dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index cb0bb06bef80..b5eb574e8548 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -100,6 +100,10 @@ struct mt792x_sta {
 
 DECLARE_EWMA(rssi, 10, 8);
 
+struct mt792x_chanctx {
+	struct mt792x_bss_conf *bss_conf;
+};
+
 struct mt792x_bss_conf {
 	struct mt76_vif mt76; /* must be first */
 	struct ewma_rssi rssi;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index ae21a2829c9c..a189ae38f2d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -261,11 +261,13 @@ int mt792x_assign_vif_chanctx(struct ieee80211_hw *hw,
 			      struct ieee80211_bss_conf *link_conf,
 			      struct ieee80211_chanctx_conf *ctx)
 {
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
 	mvif->bss_conf.mt76.ctx = ctx;
+	mctx->bss_conf = &mvif->bss_conf;
 	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
@@ -277,10 +279,12 @@ void mt792x_unassign_vif_chanctx(struct ieee80211_hw *hw,
 				 struct ieee80211_bss_conf *link_conf,
 				 struct ieee80211_chanctx_conf *ctx)
 {
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
+	mctx->bss_conf = NULL;
 	mvif->bss_conf.mt76.ctx = NULL;
 	mutex_unlock(&dev->mt76.mutex);
 }
@@ -556,6 +560,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	hw->sta_data_size = sizeof(struct mt792x_sta);
 	hw->vif_data_size = sizeof(struct mt792x_vif);
+	hw->chanctx_data_size = sizeof(struct mt792x_chanctx);
 
 	if (dev->fw_features & MT792x_FW_CAP_CNM) {
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-- 
2.34.1


