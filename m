Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AA4C3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0AqvqvX1XnawEbT1CZxbW1N0nw9RHpYcHRkl50qL/k=; b=Xnfop3VGcYm4tgK6J6Hkvf52uT
	unstcY6uNovT4caDF3AovdBHU8GNFqr+fAtrU/29Cmv4XWRIehbFAtWIezrvOQdhR6ALjJmGx6tkT
	NH1z3Gf07mUsIozDukw0zIACAbtbzSHEdbXhdwxEiVzii/h3CsKoJg2SEU8fIpLOnKnaWfYkUQeUB
	ngy12pvV7GZzH+EPIWbw81Xkdj1Nkbaj3V1a6E6ymFk9avRZBj/zwLMGT4qHpXG/ugevKVUBac3Lp
	KLt5o3l91jgRsTvACuwiKwa+m2QnPUkNhQrSGpDRQqMxmyHpTxQedAKyThTh88jPkBIAFkCty9tYo
	g9KxFK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mS-0000000HXgT-3MII;
	Sat, 06 Jul 2024 08:28:28 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mP-0000000HXeT-1U96
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:26 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25e19ad0050so386953fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254504; x=1720859304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0AqvqvX1XnawEbT1CZxbW1N0nw9RHpYcHRkl50qL/k=;
        b=A/4nZiYLwIkCTyWSkGw0sO/ip/QtphHA++qAyUjkmFoYmSiz9XAzwD7VJr4RbtDh5f
         +XxGWoK78WSnlCoYdrf4Z8MP1CfUlvt4zdOAIBB6TazuL5W7/at712LffQazWB7Xtn2A
         xIXoMCYVMU3Hnn26lEYq4W7gZaHgTS5AGYgqcU2ydakvTJYV6iVV+7dObJpw6Yx0oJb3
         8FQ/EnI0Nm7zQGXB8Flr+m8I7k+5NjhADpdYfBesJrG296v2Tnhi/6/ORQ0sz8v2Kmct
         zQeffAz1f1VVshSV5m7NXsUY8XXAIczZX3mykCNz7vpDJKKIe9Nd04Lw3Ua9F5OsmZLU
         pDSg==
X-Forwarded-Encrypted: i=1; AJvYcCWaeRsbyv8hjTLriLzzSL3ouSJcHZrM5+/q0E3zsmuT6TCgvnohhErjUZLxr7gsxPMLISlduYdNcGCrGOdMijDKz/qVlogXcLG+VocXhupvN9bC
X-Gm-Message-State: AOJu0YzwniW5qKStbSxInWIm67Z9Xjfa1R3bHGrToSJ1bYvfmzY05XWm
	2j3OsmwTu4JaH9j9U1AOAakyInm4v5r3OI3I/ugdOU6ykXGuOApp
X-Google-Smtp-Source: AGHT+IGNdZ/1sIor3R57hAlhxrzJbk4ui2gjH+E4YJ1N0eT/zRwXtj5JuC6ek9LLKjnf7JbaT/WYfg==
X-Received: by 2002:a05:6870:eca3:b0:25e:c0b:82c5 with SMTP id 586e51a60fabf-25e2bf101admr6655751fac.3.1720254504111;
        Sat, 06 Jul 2024 01:28:24 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:22 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 02/37] wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove] for MLO
Date: Sat,  6 Jul 2024 01:27:42 -0700
Message-Id: <2410cc73eec3849c2185b5cfa613b7e903e68abb.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012825_422557_B9E1A308 
X-CRM114-Status: GOOD (  11.97  )
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

[add, assoc, remove] the per-link STA from the corresponding to per-link
BSS with the same link id. The change remains compatible with the non-MLO
mode.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 32 ++++++++++++-------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8b10b63bc98d..a043d93f3e1d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -728,21 +728,24 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
+	struct mt792x_bss_conf *mconf;
+	u8 link_id = link_sta->link_id;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 	int ret, idx;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
+	mconf = mt792x_vif_to_link(mvif, link_id);
 	INIT_LIST_HEAD(&mlink->wcid.poll_list);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
-	mlink->wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
+	mlink->wcid.phy_idx = mconf->mt76.band_idx;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
 
@@ -753,11 +756,11 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
-		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
 					link_conf, link_sta, false);
 
 	ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
@@ -790,7 +793,6 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 				      struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
@@ -802,9 +804,13 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
-		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+		struct mt792x_bss_conf *mconf;
+
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
 					link_conf, link_sta, true);
+	}
 
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 
@@ -830,11 +836,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct ieee80211_bss_conf *link_conf;
+	u8 link_id = link_sta->link_id;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
@@ -844,12 +851,13 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
-		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-		mt7925_mcu_add_bss_info(&dev->phy,
-					mvif->bss_conf.mt76.ctx, link_conf,
+		struct mt792x_bss_conf *mconf;
+
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 					link_sta, false);
 	}
 
-- 
2.25.1


