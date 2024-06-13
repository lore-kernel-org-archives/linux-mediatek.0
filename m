Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2009C27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv6e/GvblL0RsnLWjjsfrvHkKEUobVf9bh+1TtsfTcE=; b=bV4/p4MZCvN7BQ+McCzPKMy8XH
	SfxJBIx2YERUoOC/7qqT+NOZ6CgaPUUX1XslqdUtN0euZVgo19rr9XBw0XVKg761rnGXCtsjiWxVi
	iD5gxeG402fCMxIe7TPpTaPsWFhorUMwgUYP7rw1Wqm7nQhBBYONcrUdKxlaGzq3fajLV2iJ7hNzJ
	J0EJUubD/5iL9KyqXS0ejynE8e7cfIOkBXDHyP5+MZFGNbQr7rJT/d95vwZEVgE9nC6hh7FtzICuC
	jjVovACHnDv+zGHN8lh2aZGw+Qh8sZD803NqrgN7tztbpJ/JubzKfgtsh2jTlUgAXW+bB3El0Gtip
	I5+cl41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakL-0000000EvoQ-0fAB;
	Thu, 13 Jun 2024 03:03:29 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakH-0000000Evm1-0Kx9
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:27 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5bad97708efso31437eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247804; x=1718852604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv6e/GvblL0RsnLWjjsfrvHkKEUobVf9bh+1TtsfTcE=;
        b=BsQX8Kevv3FQNKZAlKv/GV8lczFemoTsmJy1lOJAL9EsiwxN2ld5GDYpndR+3LndES
         V7Ff6gjApV4WdhTk+mCfyd2afxv3UxVmaFhtvsmHuLzt4cWsCQywT3I9EM3DuD5cHfnz
         1CcFYpDMIMy8OIEVfYEU0l1KKGOav4SNVqcZSmYlYOSsdHnNTsF3GrMRmf+yeGSylug1
         TF2/Kbx2gvGdgIn/fWfhKk0chcj36dn/AgU1Fjnewf7hvVloogOVJMAOQ1KSO/UFv1uE
         kBFMVXpAGNY3K2nF4IOL6eiKGjsWYfiDGb2oDbO8sxK0qAdUIWuD/pZpJGNTujbgsOr7
         Ydgg==
X-Forwarded-Encrypted: i=1; AJvYcCX/j7txUlx5eBK8eF08N6E5gmMKzWk6KTm9Be+LwQ8qqk+ihQ06d8S/f3jOcbrdH62zihn/RHXlpPzao0baF0sl0LmXV+qT2Zm5zLoKTszJXj2f
X-Gm-Message-State: AOJu0YwIuxv9t+lcL+29g3J4m7DZrNlHH2pw+7dwfSkEG+zypPKFuiPb
	BRPuh/k87qZudg73yq9qM5PKjTkjm4CBDlpfFUT1cOns14vWAaKb
X-Google-Smtp-Source: AGHT+IEKchg4RAPKv1w2iVq2otrOKx7P35BjC4n9Lr47n3pV1QU6C/eh0GgoM8TtNqpFehq/1WeJ3A==
X-Received: by 2002:a4a:3101:0:b0:5ba:ca8a:6598 with SMTP id 006d021491bc7-5bb3b7b972bmr3906975eaf.0.1718247803868;
        Wed, 12 Jun 2024 20:03:23 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:22 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 17/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_basic_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:11 -0700
Message-Id: <20240613030241.5771-18-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200325_162161_29FB7252 
X-CRM114-Status: GOOD (  14.53  )
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

Extend mt7925_mcu_bss_basic_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 25 ++++++++++---------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 6a1afff92399..457e1fa2fde1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -338,6 +338,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->phy = phy;
 	mvif->bss_conf.mt76.band_idx = 0;
 	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
+	mvif->bss_conf.vif = mvif;
 
 	if (phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
 		mvif->bss_conf.mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 028c94d8c21f..18e19ffdbb7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2062,15 +2062,16 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 
 static void
 mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
-			 struct ieee80211_vif *vif,
+			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_sta *sta,
 			 struct ieee80211_chanctx_conf *ctx,
 			 struct mt76_phy *phy, u16 wlan_idx,
 			 bool enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_vif *vif = link_conf->vif;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
-				  &mvif->sta;
+				  &mconf->vif->sta;
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_connac_bss_basic_tlv *basic_req;
@@ -2081,8 +2082,8 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_BASIC, sizeof(*basic_req));
 	basic_req = (struct mt76_connac_bss_basic_tlv *)tlv;
 
-	idx = mvif->bss_conf.mt76.omac_idx > EXT_BSSID_START ? HW_BSSID_0 :
-						      mvif->bss_conf.mt76.omac_idx;
+	idx = mconf->mt76.omac_idx > EXT_BSSID_START ? HW_BSSID_0 :
+						      mconf->mt76.omac_idx;
 	basic_req->hw_bss_idx = idx;
 
 	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band, sta);
@@ -2092,15 +2093,15 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	else
 		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_OFDM_INDEX);
 
-	memcpy(basic_req->bssid, vif->bss_conf.bssid, ETH_ALEN);
+	memcpy(basic_req->bssid, link_conf->bssid, ETH_ALEN);
 	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, sta);
-	basic_req->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
-	basic_req->dtim_period = vif->bss_conf.dtim_period;
+	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
+	basic_req->dtim_period = link_conf->dtim_period;
 	basic_req->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
 	basic_req->sta_idx = cpu_to_le16(msta->deflink.wcid.idx);
-	basic_req->omac_idx = mvif->bss_conf.mt76.omac_idx;
-	basic_req->band_idx = mvif->bss_conf.mt76.band_idx;
-	basic_req->wmm_idx = mvif->bss_conf.mt76.wmm_idx;
+	basic_req->omac_idx = mconf->mt76.omac_idx;
+	basic_req->band_idx = mconf->mt76.band_idx;
+	basic_req->wmm_idx = mconf->mt76.wmm_idx;
 	basic_req->conn_state = !enable;
 
 	switch (vif->type) {
@@ -2333,7 +2334,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		return PTR_ERR(skb);
 
 	/* bss_basic must be first */
-	mt7925_mcu_bss_basic_tlv(skb, link_conf->vif, sta, ctx, phy->mt76,
+	mt7925_mcu_bss_basic_tlv(skb, link_conf, sta, ctx, phy->mt76,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index f675709f419a..9452a3592950 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -106,6 +106,7 @@ struct mt792x_chanctx {
 
 struct mt792x_bss_conf {
 	struct mt76_vif mt76; /* must be first */
+	struct mt792x_vif *vif;
 	struct ewma_rssi rssi;
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
 };
-- 
2.34.1


