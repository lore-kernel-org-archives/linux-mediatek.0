Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9ABC27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkHDBlOkDJ0JO9nw4+ATjhclLWfJKvnEvDbeM9MFnc4=; b=gbJ1N5zt3T/cyFqeGd4+YHK46P
	qAOK3fvmZaAg8yNG8b4Y+XFiuvZGmzV/yKfv661RZ7Sl5Z0VPBC8T5Yszc21MEAdgam6OSgU5V2uU
	colq5ooxzKBh/jcclmTZkoiOb5EQvOT3rT27KRWVIV+ReFkRFT+yZfz3ZXSal6C2whrNclEs5tSjL
	wfYvFeTKhDbvYRRXSHf05uaaWa3pQXi6W0jM4jbY7FRm5D7bjjFVWVwtBqpbQ1a0tVCY0a9ARGEJR
	PrDCbPFi7Yo0y31IyWAqqqFe/QFAgtQiCDpp03mZ6fcmvoF9I5jIQkAERp86XGw9aXfKOYLmBuFt4
	gPv4wXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal0-0000000EwFq-0GGD;
	Thu, 13 Jun 2024 03:04:10 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaku-0000000Ew9t-2hq2
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:08 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d1b8bacf67so76912b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247842; x=1718852642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkHDBlOkDJ0JO9nw4+ATjhclLWfJKvnEvDbeM9MFnc4=;
        b=U4SgrkUW23FKRurhvO+bppcqyAstiO/3drt2/5CZbR9sb04aqYFf3qjwVP/qFIONuj
         kuAFWx9yeH6Ws/7eR7t+WmCPom6eLBI747km7VMi6SIckg3UBNkDp86YakoE+0baoYaW
         3HsLBIn//jTeZmQWpw0BcY4CPCtDCpd7xeAnNbshTgEshDeqs5l6lZau3usAzKMkvqpL
         M9Hc0Sats6GFzXigNv+1OsrIxOU/rxgcch5nRh+KXX28hd8x5Epys6Y04DSly2P2acC+
         SjWRDrqDwcEZKvB9mk/f3w2zxYaqaI06Io38Fgl62usFrhu/EolGSws1Zmy+Sg3ylH2B
         T0NA==
X-Forwarded-Encrypted: i=1; AJvYcCVC1zGHTeo+VN0p6WrCFuXYwF6xpuxGlxgsOPmwOXyYdYrcpG6sYbdO62euO1nhLGls/x5xwPN2CnuLRV0lgolLQzMbeDTMqBhWespo+K2HGkXs
X-Gm-Message-State: AOJu0YwxY0GyD2sMsFj5ZGHbJ4GecPTPaUPGakaWiv6eF/fBZ28kaDc6
	bwpJfPWs/9MoLKNW2zFtwuYRRtGDJXy2ye9les1tiyJ2IZ7QrH+O
X-Google-Smtp-Source: AGHT+IEC7RP+/DIV32Apb3dYvlXNUgZrif0a/bIJWXgUP/56rqQwGaQ3rLescw43Rs0OCodd5k4AZQ==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3673097eaf.0.1718247841693;
        Wed, 12 Jun 2024 20:04:01 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:00 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 36/47] wifi: mt76: mt792x: extend mt76_connac_get_phy_mode_v2 for per-link STA
Date: Wed, 12 Jun 2024 20:02:30 -0700
Message-Id: <20240613030241.5771-37-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200405_355901_CF01F3F4 
X-CRM114-Status: GOOD (  13.05  )
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

Extend mt76_connac_get_phy_mode_v2 with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c | 16 +++++++++-------
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  2 +-
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index f7ba3afb3ccf..294f79ab7ca6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -786,7 +786,8 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_he_tlv_v2);
 
 u8
 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
-			    enum nl80211_band band, struct ieee80211_sta *sta)
+			    enum nl80211_band band,
+			    struct ieee80211_link_sta *link_sta)
 {
 	struct ieee80211_sta_ht_cap *ht_cap;
 	struct ieee80211_sta_vht_cap *vht_cap;
@@ -794,11 +795,11 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	const struct ieee80211_sta_eht_cap *eht_cap;
 	u8 mode = 0;
 
-	if (sta) {
-		ht_cap = &sta->deflink.ht_cap;
-		vht_cap = &sta->deflink.vht_cap;
-		he_cap = &sta->deflink.he_cap;
-		eht_cap = &sta->deflink.eht_cap;
+	if (link_sta) {
+		ht_cap = &link_sta->ht_cap;
+		vht_cap = &link_sta->vht_cap;
+		he_cap = &link_sta->he_cap;
+		eht_cap = &link_sta->eht_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
 
@@ -904,7 +905,8 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
 	phy = (struct sta_rec_phy *)tlv;
-	phy->phy_type = mt76_connac_get_phy_mode_v2(mphy, vif, band, sta);
+	phy->phy_type = mt76_connac_get_phy_mode_v2(mphy, vif, band,
+						    &sta->deflink);
 	phy->basic_rate = cpu_to_le16((u16)vif->bss_conf.basic_rates);
 	phy->rcpi = rcpi;
 	phy->ampdu = FIELD_PREP(IEEE80211_HT_AMPDU_PARM_FACTOR,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 5b40d51ee728..2c939468d141 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1894,7 +1894,8 @@ int mt76_connac_mcu_sta_update_hdr_trans(struct mt76_dev *dev,
 					 struct mt76_wcid *wcid, int cmd);
 void mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta);
 u8 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
-			       enum nl80211_band band, struct ieee80211_sta *sta);
+			       enum nl80211_band band,
+			       struct ieee80211_link_sta *link_sta);
 int mt76_connac_mcu_wtbl_update_hdr_trans(struct mt76_dev *dev,
 					  struct ieee80211_vif *vif,
 					  struct ieee80211_sta *sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 3cda538307b5..321a164a6e14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1526,7 +1526,7 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 	phy = (struct sta_rec_phy *)tlv;
 	phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
 						    chandef->chan->band,
-						    link_sta->sta);
+						    link_sta);
 	phy->basic_rate = cpu_to_le16((u16)link_conf->basic_rates);
 	if (link_sta->ht_cap.ht_supported) {
 		af = link_sta->ht_cap.ampdu_factor;
-- 
2.34.1


