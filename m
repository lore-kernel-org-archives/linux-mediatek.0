Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0431AC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qyCpY+byuISWjWQLZo5DP4pBOanX+F+FMRDfBJvu2s=; b=FY1TqrUlJ1Nu03WQE6RYtucPOA
	Cl8t8+UIiTS3s20ZItrlzEHyAf4cS5721Y+CHQ52iBCRrd+cWzVZu1vHaJh/q3IyYmxbE7om4RZbe
	KtouVyr0pWvB3M9pfa5gZs/w7AcCdQG4SbZa46BgLW8QP21PiDlBCaqdx6AD2bMzHWobgj1jSDUDx
	ewnOqUou6bB4Uz+JWZdIyGDl+eVIX/IPAR5SHh08gwvM4Q9wXpY1lbu6f1vgRTavLutamiDmN8Kzm
	OsOGuxBQv5EycTjVbewIuqFrdQAsMjueoJ2oFcWOsoZ9mLyEqyz1Q1T5XgjFIc2zKFUocD6RijZve
	fphn53rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalF-0000000EwSO-1qHP;
	Thu, 13 Jun 2024 03:04:25 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalA-0000000EwNz-3jYl
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:23 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38487eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247860; x=1718852660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qyCpY+byuISWjWQLZo5DP4pBOanX+F+FMRDfBJvu2s=;
        b=O7Utp0GSDlbgwSLkeOCEuoiWEF3NDSoL0jML+IiO0XW+gOYuewCU8WtsR6440hqgnL
         n0ZA/yut8G7Wu/5W4dJLxcWQ/R+RT41Z1nGsifx8bEzGL1Pal/NqVTUBpqraW20Jydfw
         Tq4wGqEmtqmgnn21U547/jMTc+Tjct9qDDSkPNVjxJhLpWv9/ifMMJpgdlpUPid5fjw0
         25NL6rTjuFk+GMllSHMAA+y+EabWDFPTAHmkAk+S+ZDlUSi76dGhtrap/Pm1LCa90/Xp
         OjV7h+IHRDWgJbBktWgeQFGMtw9Wwll+7QyWDvmHUEDhO9K6uplJ/tgR2ssnFRvcdzMt
         a9gg==
X-Forwarded-Encrypted: i=1; AJvYcCXOsaNeHpKs5zTZspz2jmhAzgA2QEmXriACh/FKyp7ONpKfYslkIjYK6pnBHCdD45KZMR7kpt6E8pNUxnaOIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzwSPYaRMJJ+oolpQupowRRPF9LPASX/4OKW9T1f76UjwJxrZ/
	stqPVLR2+kJq2ngkreWD6bgRjcpp5GZydaRhiONkd+LuPHu3ws6j
X-Google-Smtp-Source: AGHT+IESQ2jcgtgOmUDbQXdFBlFmVcT8fDwRZIVNyrs0Ci4sQ97lOJGCN79nGkpTnuurIm5NCcT95g==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr287315eaf.1.1718247859993;
        Wed, 12 Jun 2024 20:04:19 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:18 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 46/47] wifi: mt76: mt7925: add mt7925_mac_link_bss_remove to remove per-link BSS
Date: Wed, 12 Jun 2024 20:02:40 -0700
Message-Id: <20240613030241.5771-47-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200420_972083_7F8E0951 
X-CRM114-Status: GOOD (  11.22  )
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

The mt7925_mac_link_bss_remove function currently removes the per-link BSS.
We will extend this function when we implement the MLO functionality.

This patch only includes structural changes and does not involve any
logic changes.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 222204916b73..bec2c1eb5240 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -113,31 +113,38 @@ void mt792x_stop(struct ieee80211_hw *hw)
 }
 EXPORT_SYMBOL_GPL(mt792x_stop);
 
-void mt792x_remove_interface(struct ieee80211_hw *hw,
-			     struct ieee80211_vif *vif)
+static void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
+				       struct ieee80211_bss_conf *link_conf,
+				       struct mt792x_link_sta *mlink)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_sta *msta = &mvif->sta;
-	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
-	int idx = msta->deflink.wcid.idx;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	int idx = mlink->wcid.idx;
 
 	mt792x_mutex_acquire(dev);
-	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf, &mvif->sta.deflink.wcid, false);
+	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
+	mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mlink->wcid, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	dev->mt76.vif_mask &= ~BIT_ULL(mvif->bss_conf.mt76.idx);
-	phy->omac_mask &= ~BIT_ULL(mvif->bss_conf.mt76.omac_idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mconf->mt76.idx);
+	mconf->vif->phy->omac_mask &= ~BIT_ULL(mconf->mt76.omac_idx);
 	mt792x_mutex_release(dev);
 
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
-	if (!list_empty(&msta->deflink.wcid.poll_list))
-		list_del_init(&msta->deflink.wcid.poll_list);
+	if (!list_empty(&mlink->wcid.poll_list))
+		list_del_init(&mlink->wcid.poll_list);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-	mt76_wcid_cleanup(&dev->mt76, &msta->deflink.wcid);
+	mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
+}
+
+void mt792x_remove_interface(struct ieee80211_hw *hw,
+			     struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+
+	mt792x_mac_link_bss_remove(dev, &vif->bss_conf, &mvif->sta.deflink);
 }
 EXPORT_SYMBOL_GPL(mt792x_remove_interface);
 
-- 
2.34.1


