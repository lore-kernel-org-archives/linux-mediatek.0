Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70527C27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swP0wzm8P3kzjuujDDrTBhNy4O6CiQrkwdq/UWr+JT4=; b=pJdixx3Z4vaEt+4IB9upYdz3l9
	OVYLC2vBtMIsSyY6Lxlf4kzjVtpEGRAMSMLHSbSmszOYzeJ/V++OvWVLyGwvgSpMOQT+aQM8Ax2f2
	nij+tSi/9mZ1xs2+kCIlR0jXEaDmjuJbRYjwRIfHbD30fNjhnD4Xev0Sq/hlsXBE9kx0zTRKx32/Z
	KIH6ZrwDSKE+omy3DyFT774iAVGApvJySOuxMG6UiGA3T8F7r1/5qQiZwcIO3fu/ZRQ/0ThZBUAkn
	vDoO+UfB32kHxfCm5q0zyGqt8VvArjuZeHTsYa3s0M6HWrZvw1FAES98B6xs9M02xrOvXWh1wdcPb
	JK/fHEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalH-0000000EwTN-0OhL;
	Thu, 13 Jun 2024 03:04:27 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal8-0000000EwMV-2zqI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:23 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5bb10cfe7daso36905eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247858; x=1718852658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swP0wzm8P3kzjuujDDrTBhNy4O6CiQrkwdq/UWr+JT4=;
        b=BUfeUKu+rJ8PeVZVAuJTag7qR3CsfEXTBiOsGlpHLqcag6U71/SyXhCc9RQB2fbXCF
         7y5fSmVqurbQop5WyPGJinWRyoEQSsC5Ggf2o4pevjUSK45JDS4NYSlH5Sx1PPfLDfGa
         Tu2mPedQz7hWdago3MdeK1fxOxSuufgE7ir7Q/MUsYA6neYnuOy7z7ghbArVfP9HJbvr
         jp4Iy39W4BocYf2J+paQ3Ox4Y5P7eXFqHMcTLjMlgv5X93X88TwGOWAo4QvqWBEiGMVt
         kWLHLaYKPrVT2Arq/5Agsp3+STyBH+Zz9yM4ABYsMzYsAZ5jW0HfWV4QfD61OFJBAIlP
         rv6A==
X-Forwarded-Encrypted: i=1; AJvYcCVBK1RDbnbHYriXMxNDA1OyyT1+C7ZCqOWyadBfqw1CmfjdyA3wUTPWNy8Y7c1cWTW6gwtgXMceMvGPKkhRbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBsB6PRSOXf4Wx0owIv3J77Mc/QSLR2izlFLN6Uc+G/7o1GJ7p
	14sErMBbDPCdE0eKpYZnzoVV+99PmczDhiuwz//zuetXVzElyL0u
X-Google-Smtp-Source: AGHT+IH3wUed9ixLi58tAQqUtbD8UtozGL9FegbZuRRfCfvGNhzx87amQWMcRaq7ZAbMt3fmnTPW1Q==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3998081eaf.0.1718247857771;
        Wed, 12 Jun 2024 20:04:17 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:16 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 45/47] wifi: mt76: mt7925: add mt7925_mac_link_bss_add to create per-link BSS
Date: Wed, 12 Jun 2024 20:02:39 -0700
Message-Id: <20240613030241.5771-46-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200418_853416_99048105 
X-CRM114-Status: GOOD (  13.62  )
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

The mt7925_mac_link_bss_add function currently creates the per-link BSS.
We will extend this function when we implement the MLO functionality.

This patch only includes structural changes and does not involve any
logic changes.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 80 ++++++++++++-------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ce5379c4d55d..611138acd16d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -317,63 +317,81 @@ static int mt7925_start(struct ieee80211_hw *hw)
 	return err;
 }
 
-static int
-mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
+				   struct ieee80211_bss_conf *link_conf,
+				   struct mt792x_link_sta *mlink)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct ieee80211_vif *vif = link_conf->vif;
+	struct mt792x_vif *mvif = mconf->vif;
 	struct mt76_txq *mtxq;
 	int idx, ret = 0;
 
-	mt792x_mutex_acquire(dev);
-
-	mvif->bss_conf.mt76.idx = __ffs64(~dev->mt76.vif_mask);
-	if (mvif->bss_conf.mt76.idx >= MT792x_MAX_INTERFACES) {
+	mconf->mt76.idx = __ffs64(~dev->mt76.vif_mask);
+	if (mconf->mt76.idx >= MT792x_MAX_INTERFACES) {
 		ret = -ENOSPC;
 		goto out;
 	}
 
-	mvif->bss_conf.mt76.omac_idx = mvif->bss_conf.mt76.idx;
-	mvif->phy = phy;
-	mvif->bss_conf.mt76.band_idx = 0;
-	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
-	mvif->bss_conf.vif = mvif;
+	mconf->mt76.omac_idx = mconf->mt76.idx;
+	mconf->mt76.band_idx = 0;
+	mconf->mt76.wmm_idx = mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
-	if (phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
-		mvif->bss_conf.mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
+	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
+		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
 	else
-		mvif->bss_conf.mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
+		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
-					  &mvif->sta.deflink.wcid, true);
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+					  &mlink->wcid, true);
 	if (ret)
 		goto out;
 
-	dev->mt76.vif_mask |= BIT_ULL(mvif->bss_conf.mt76.idx);
-	phy->omac_mask |= BIT_ULL(mvif->bss_conf.mt76.omac_idx);
+	dev->mt76.vif_mask |= BIT_ULL(mconf->mt76.idx);
+	mvif->phy->omac_mask |= BIT_ULL(mconf->mt76.omac_idx);
 
-	idx = MT792x_WTBL_RESERVED - mvif->bss_conf.mt76.idx;
+	idx = MT792x_WTBL_RESERVED - mconf->mt76.idx;
 
-	INIT_LIST_HEAD(&mvif->sta.deflink.wcid.poll_list);
-	mvif->sta.deflink.wcid.idx = idx;
-	mvif->sta.deflink.wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
-	mvif->sta.deflink.wcid.hw_key_idx = -1;
-	mvif->sta.deflink.wcid.tx_info |= MT_WCID_TX_INFO_SET;
-	mvif->sta.vif = mvif;
-	mt76_wcid_init(&mvif->sta.deflink.wcid);
+	INIT_LIST_HEAD(&mlink->wcid.poll_list);
+	mlink->wcid.idx = idx;
+	mlink->wcid.phy_idx = mconf->mt76.band_idx;
+	mlink->wcid.hw_key_idx = -1;
+	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	mt76_wcid_init(&mlink->wcid);
 
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	ewma_rssi_init(&mvif->bss_conf.rssi);
+	ewma_rssi_init(&mconf->rssi);
 
-	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.deflink.wcid);
+	rcu_assign_pointer(dev->mt76.wcid[idx], &mlink->wcid);
 	if (vif->txq) {
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
 		mtxq->wcid = idx;
 	}
 
+out:
+	return ret;
+}
+
+static int
+mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	int ret = 0;
+
+	mt792x_mutex_acquire(dev);
+
+	mvif->phy = phy;
+	mvif->bss_conf.vif = mvif;
+	mvif->sta.vif = mvif;
+
+	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
+	if (ret < 0)
+		goto out;
+
 	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
 out:
 	mt792x_mutex_release(dev);
-- 
2.34.1


