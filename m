Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B75C27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgMigc2VAhtdTb1uu0yJ7C/V9AuPVgLB5PjEnDvYkH8=; b=Mjh8sXyXZ2jZ3iN4wKpNxgtkrq
	rpweJ6P1x19mOCp1hQ+0pzP/QUyBvYFj1tC6uidQ5aHWvjYxr9LPCa3xnkJuYeLd+KNdnbBR37k6D
	v92VVqBSzKKxWW5Jg69mDbnl624brY7N36e1oXXHca3bjhO/7/fUXH4YAk8EL3w3Bs/y1SIqpkBVc
	y9knM0CQLtaFF60pFWounMECynQisx5r8a/4r7U7WcT2VdM4gu4i3pg8vKDDzMY884ti3d98u3JZJ
	43hJS3LRNz2ZQUmAfJLhPwn78IKs4beF6niMj9dcr/vpTeBgUdCx+gBzCRzozz0CNgNhj9k2DIl9B
	GtFVTvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal7-0000000EwLF-0tsE;
	Thu, 13 Jun 2024 03:04:17 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal2-0000000EwH9-22Nf
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:15 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5bb10cfe7daso36900eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247851; x=1718852651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgMigc2VAhtdTb1uu0yJ7C/V9AuPVgLB5PjEnDvYkH8=;
        b=HH7B1qZZqFzyNXUEzSk6dqyOmfJjVY0EDJ1SOYL9z1vemK+veJfSlUv97jjFdOsB+P
         b/1UOM5UkeowEUP6xPFFwDiwaroes0A6XhirtzBaUHwA7A4g3BEW47tmW9KO8Pwar4WC
         +WLFbw64YoYToPl46ShhvGarFNFZW3YLETQIUdKWpcvr0cJtqpZ0ItcIpprn8C1LuVcZ
         3xBmUEq0dDlDi2A63qHJIcJLEVXhIqVzvy7ai78k8nwLw/6uYWaj30LyP77tyUcDAQBx
         1ifHC0XdTl8iqky/lJTu83mXayU9IJLPOPsrpxS35Y9vbE2ODZPVAyiJ2DSa9UzXdd+8
         erhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXICxGt7i7a0hmspzj+G7uRIYteg5eKvpflK+LsF/bywx4zGkqADaC1ST2ZkHq79IzV/GCNsf4bFofgtd1Le14FLILzphhtfyy8DNLlbBrET6gP
X-Gm-Message-State: AOJu0YwJ1trxcYgvbVbjuWfVAJPmhiTelOL7jEzKMs3zzbse+HQ02euR
	PrV8mhUMZEIYqJOGWs8WomfhaJCXYLgyhdcCrqsxzs1ua7l0eTaq
X-Google-Smtp-Source: AGHT+IELnhgtggY4/ayU1vQAw9jcuSekNmvxXHACEAQ0mYwcUJ76ywNVecENM/8BKUBdyqxm5HkDdQ==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr286964eaf.1.1718247851492;
        Wed, 12 Jun 2024 20:04:11 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:10 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 41/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_basic_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:35 -0700
Message-Id: <20240613030241.5771-42-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200412_619972_C66966B3 
X-CRM114-Status: GOOD (  11.54  )
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

Extend mt7925_mcu_bss_basic_tlv with the per-link STA configuration.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 24966e614303..7156ba092302 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2078,18 +2078,17 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 static void
 mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 			 struct ieee80211_bss_conf *link_conf,
-			 struct ieee80211_sta *sta,
+			 struct ieee80211_link_sta *link_sta,
 			 struct ieee80211_chanctx_conf *ctx,
 			 struct mt76_phy *phy, u16 wlan_idx,
 			 bool enable)
 {
 	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
-	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
-				  &mconf->vif->sta;
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_connac_bss_basic_tlv *basic_req;
+	struct mt792x_link_sta *mlink;
 	struct tlv *tlv;
 	int conn_type;
 	u8 idx;
@@ -2102,7 +2101,7 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	basic_req->hw_bss_idx = idx;
 
 	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band,
-							 &sta->deflink);
+							 link_sta);
 
 	if (band == NL80211_BAND_2GHZ)
 		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_ERP_INDEX);
@@ -2110,12 +2109,22 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_OFDM_INDEX);
 
 	memcpy(basic_req->bssid, link_conf->bssid, ETH_ALEN);
-	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band,
-						      &sta->deflink);
+	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, link_sta);
 	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
 	basic_req->dtim_period = link_conf->dtim_period;
 	basic_req->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
-	basic_req->sta_idx = cpu_to_le16(msta->deflink.wcid.idx);
+
+	if (link_sta) {
+		struct mt792x_sta *msta;
+
+		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+
+	} else {
+		mlink = &mconf->vif->sta.deflink;
+	}
+
+	basic_req->sta_idx = cpu_to_le16(mlink->wcid.idx);
 	basic_req->omac_idx = mconf->mt76.omac_idx;
 	basic_req->band_idx = mconf->mt76.band_idx;
 	basic_req->wmm_idx = mconf->mt76.wmm_idx;
@@ -2352,7 +2361,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		return PTR_ERR(skb);
 
 	/* bss_basic must be first */
-	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta->sta, ctx, phy->mt76,
+	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta, ctx, phy->mt76,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 
-- 
2.34.1


