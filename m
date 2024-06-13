Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75D2C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kqNpOQikz31Rvo98UCj21K+HMYQ5mjJ2R+HS/m16G4=; b=MBk3oenXva102K2zGtSqpnD9D5
	rI0IHWwEiQdo5/D2h5u/04PO6Uva3o9ScNsWIbSOGUdZ0UUv2qS76ImdS9bJaxQ/jvZ3H5oCRe8Wu
	9fimgVePV3e1DnvO95RAXjjS6aB4GJnaswxiGxhaUEr24CaCvkGa33A1dQhy3CYQY/SqFBm60MxaD
	hmK3DLj+ih6NuH5NO77OS7a5m2umpaD8QAmG73EaPXNhW8q9J15t0co11flYS5wTagYNAfsf32Kcv
	4apjCI68nWSRXjRsdXX80emiRrycSEODFcB7+avslgMHE6heRRXA1+qP4HeN3iAOxnGrPPdrjUMmC
	dSQXGXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakw-0000000EwCy-0o0p;
	Thu, 13 Jun 2024 03:04:06 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakq-0000000Ew8s-1ZQ5
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:02 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b97f09cde3so43154eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247839; x=1718852639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kqNpOQikz31Rvo98UCj21K+HMYQ5mjJ2R+HS/m16G4=;
        b=bTrNloSvZ0N1SuziB1uUhMWP8IOc55/MhMrVttaUO8IPk0gfwQn8msxy3ZDDUl84cZ
         RDPU+OhZ4L+KxRe0URYZdzw2ZOFA97+QP1hTOB2B2W95LJiv0Fq2VIpdPvbgx8tl2vRh
         VNQPE590EjCFEQtsJQ/lwuQDiow6SNy992PT7Cf/lQKqhkf22rP/6tDBTjKRt/mpEWMY
         DI9HtdBQLMdcldAWmlep0Cb8kytbXp1x6gGr8IfHT08M0iErNHPuwJvRpBlhRgfmTpyS
         PEr+hZzMM3GEigyjX61q0Dqdqcnkc9eZ/7z8lWhXMFDdIQ3EB/KHEKtJEaAedNOjKcA7
         LKXw==
X-Forwarded-Encrypted: i=1; AJvYcCWlGzPlxrCPB+6S3BJ+ff+Db84yXQOaHAgEOiwIxvH3z9IMCBA2JHIP+JS4jnINwwl1cGgW/e3UQEvcDe4Skg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7RsboUKZ64lJN9sVr6sY3oBLGZ/YAVsDa2hkbwhcNsyC8QJD
	eyv+1Zn34YjguYo4oNfwYJAWNC2jt8hYZDrfGA8K8izodWKqC+IZ
X-Google-Smtp-Source: AGHT+IEtnVHuansGHURBC+LEKvMH3Jy7bWaeX+lPmpLCZZoarezi4l511KEJO27+VI+h1RFYRCfhew==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3997374eaf.0.1718247839547;
        Wed, 12 Jun 2024 20:03:59 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:57 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 35/47] wifi: mt76: mt7925: extend mt7925_get_phy_mode for per-link STA
Date: Wed, 12 Jun 2024 20:02:29 -0700
Message-Id: <20240613030241.5771-36-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200400_571390_6AB18581 
X-CRM114-Status: GOOD (  13.37  )
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

Extend mt7925_get_phy_mode with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c      |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      |  3 ++-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 87f918461051..f7ba3afb3ccf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1300,7 +1300,8 @@ int mt76_connac_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_ba);
 
 u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
-			    enum nl80211_band band, struct ieee80211_sta *sta)
+			    enum nl80211_band band,
+			    struct ieee80211_link_sta *link_sta)
 {
 	struct mt76_dev *dev = phy->dev;
 	const struct ieee80211_sta_he_cap *he_cap;
@@ -1311,10 +1312,10 @@ u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	if (is_connac_v1(dev))
 		return 0x38;
 
-	if (sta) {
-		ht_cap = &sta->deflink.ht_cap;
-		vht_cap = &sta->deflink.vht_cap;
-		he_cap = &sta->deflink.he_cap;
+	if (link_sta) {
+		ht_cap = &link_sta->ht_cap;
+		vht_cap = &link_sta->vht_cap;
+		he_cap = &link_sta->he_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 2a858b1ca82e..5b40d51ee728 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1988,7 +1988,8 @@ mt76_connac_get_he_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif);
 const struct ieee80211_sta_eht_cap *
 mt76_connac_get_eht_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif);
 u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
-			    enum nl80211_band band, struct ieee80211_sta *sta);
+			    enum nl80211_band band,
+			    struct ieee80211_link_sta *sta);
 u8 mt76_connac_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 				enum nl80211_band band);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 2c95c69f395d..0f50c6659802 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1503,7 +1503,7 @@ mt7915_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7915_dev *dev,
 
 	ra->valid = true;
 	ra->auto_rate = true;
-	ra->phy_mode = mt76_connac_get_phy_mode(mphy, vif, band, sta);
+	ra->phy_mode = mt76_connac_get_phy_mode(mphy, vif, band, &sta->deflink);
 	ra->channel = chandef->chan->hw_value;
 	ra->bw = sta->deflink.bandwidth;
 	ra->phy.bw = sta->deflink.bandwidth;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 32ea71128280..3cda538307b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2114,7 +2114,8 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_OFDM_INDEX);
 
 	memcpy(basic_req->bssid, link_conf->bssid, ETH_ALEN);
-	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, sta);
+	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band,
+						      &sta->deflink);
 	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
 	basic_req->dtim_period = link_conf->dtim_period;
 	basic_req->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
-- 
2.34.1


