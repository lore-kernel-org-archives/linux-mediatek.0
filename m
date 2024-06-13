Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C9AC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qaT8b7yGtuN3JUwjHPR4rGNkOaYwHk+6PNJhQjqaCo=; b=nHquJKNLNomv941SOAg4oRD/BD
	hgmYPq/+dpDq72XDEtrsgr5w/dS97o/E47hcV6CB9joxWf3tsQxZEd5EbcD4+hMxDr6SGf/v8dLAz
	DZih2wG3xKuh5IjMQtCVIzbW3O0ucYPsV7yBT9un2jcTOggAHrmx2MusJu1w/jsneuF2I+2+0nbNY
	g0XVMa18d4LVBTTo3MZsDoet388jx2nlWU7D2E2AhAE+BkutmBuLT22eRmmlwzM/eHm1CB0bTsr5n
	cNel2f8vQXaEJwVJj+iOuGHeHyHCQNT6OomWQ+vPvRoBv9DbXYg3dQct2Dv94i5sIWXqrzSwVy7t3
	T9ta6c8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal9-0000000EwMx-1Vj1;
	Thu, 13 Jun 2024 03:04:19 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal3-0000000EwIo-43hp
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:16 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-254925e6472so70203fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247853; x=1718852653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qaT8b7yGtuN3JUwjHPR4rGNkOaYwHk+6PNJhQjqaCo=;
        b=LMu0AHQj3cGHJKuIB+DwPKEiTrgpqPkRr9M8vCmOF83aWbc3R8zb/4eFVnT3WCtwiG
         jA8JMXeYJs6ppmwNjBtv/3j/F6qKdkRa0pwAHL5tbeM4CZZmGO0lKskzhU/RcRA7yK7z
         9+fLejcQ38wXJIPNYcuVV0j4EWr3525mxMr3vOry9CaXqOzxSjvwjKWFAkHEClGdiESA
         zoG2hb4Ilxl15sVIoS2w3IPpxPB7j9udP3dLAgbPRb2lqNN2FtHmeMkCqUC4sLMTvq1z
         JefHe3CfPfJbxImojLr5cqPdjLGAysi4/2xkLJyeCGpfFX9ZRDvBCO6XsiATQ9y0apMP
         ASXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfZKLpl2g2WmV3BN3kwcBApKnK+BdxanvE3kYO4QvUzJxHa3Ya5HYrcHxd5tm59dZywUggr9LZHXz+e/hP2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8JXx7WlGEQ0kxIrsXmhBG8Zrwjosl+tJk+SV3VljYXWgk+7Ys
	Z/yz1eBM3EOa+xRpbYaWIeJl+876FKs31okqSZUm9L/GMVwl+RlB
X-Google-Smtp-Source: AGHT+IEqhSHMsARTCevRepG4Bai6+yCrp4bNWqrV+fqylm24sKnywEbKk5XYKWvL19S43sQzF1dk/A==
X-Received: by 2002:a05:6820:b0b:b0:5ba:c4ed:ee98 with SMTP id 006d021491bc7-5bb3b7a4c51mr3591290eaf.0.1718247853048;
        Wed, 12 Jun 2024 20:04:13 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:11 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 42/47] wifi: mt76: mt7925: add mt7925_mac_link_sta_add to create per-link STA
Date: Wed, 12 Jun 2024 20:02:36 -0700
Message-Id: <20240613030241.5771-43-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200414_188489_F429643D 
X-CRM114-Status: GOOD (  12.15  )
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

The mt7925_mac_link_sta_add function currently adds the per-link STA.
We will extend this function when we implement the MLO functionality.

This patch only includes structural changes and does not involve any
logic changes.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 47 ++++++++++++-------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b91992745462..3911cf71462f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -702,45 +702,46 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
-int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta)
+static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_sta *msta;
 	int ret, idx;
 
+	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
-	INIT_LIST_HEAD(&msta->deflink.wcid.poll_list);
-	msta->vif = mvif;
-	msta->deflink.wcid.sta = 1;
-	msta->deflink.wcid.idx = idx;
-	msta->deflink.wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
-	msta->deflink.wcid.tx_info |= MT_WCID_TX_INFO_SET;
-	msta->deflink.last_txs = jiffies;
+	INIT_LIST_HEAD(&mlink->wcid.poll_list);
+	mlink->wcid.sta = 1;
+	mlink->wcid.idx = idx;
+	mlink->wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
+	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	mlink->last_txs = jiffies;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
 		return ret;
 
-	if (vif->type == NL80211_IFTYPE_STATION)
-		mvif->wep_sta = msta;
-
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
 
 	/* should update bss info before STA add */
-	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-					link_conf, &sta->deflink, false);
+					link_conf, link_sta, false);
 
-	ret = mt7925_mcu_sta_update(dev, &sta->deflink, vif, true,
+	ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
 				    MT76_STA_INFO_STATE_NONE);
 	if (ret)
 		return ret;
@@ -749,6 +750,20 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	return 0;
 }
+
+int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+
+	msta->vif = mvif;
+
+	if (vif->type == NL80211_IFTYPE_STATION)
+		mvif->wep_sta = msta;
+
+	return mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+}
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
 void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-- 
2.34.1


