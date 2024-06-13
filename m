Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A207DC27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHk3C2PwpK+oygytSYiJpUDeuuAoM9zKNfmYXO0m1ZQ=; b=zSIL1XPy/dxWnRpOTkRiLNiEZx
	6AG7yQCGMjQttbbfVRIHCSfSI7BtrsNjrESusRXaZXuPX1uVlCYmx9dqfjRxLPhEU5ZFI30Rmf8jx
	17HI2JQO+OBJjk5ci9pwzzW3dZEiHDYRPRECs1m9sRZe8zkVFW55eqT3cP2F0elh8aLZDtpaKazx+
	VXY4QwzrQuFgRIeJaxGHGkiFmXY0vTlNfS1Z1BCy9tQ+sudVPY32hQblSW2z8AFy24nXo+d/eJUeN
	tab2DToB+//poBgk8K1NK0Db/9vi/zbU3IK5szujJws+feDc25QFKwuvl8y+yc5AhJHfbax1Bjljh
	r5YY1fvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHako-0000000Ew7M-13uX;
	Thu, 13 Jun 2024 03:03:58 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakg-0000000Ew2I-3OTq
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:56 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d21c5b48f5so75208b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247829; x=1718852629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHk3C2PwpK+oygytSYiJpUDeuuAoM9zKNfmYXO0m1ZQ=;
        b=S4hL2PY+TRe6JUd1cysSQ+35BYt0hdkGDNIM7ao6hcChEmWkSZ41raVjI6PYiO7dYd
         Qbqtncw2aiwchSAspparW8YarK7pcwdnI/eIRxQ5hmyKcl+QcJ+IUVfF3ZQTFD7b5c+o
         s/KMirUw0m89Q2RWvSJ3YuuGb4CUBJXJC3Zh4657YWx/0/fx2lfIvvlw8g9rbUYzWtyL
         zW0dNzm5k+pU1NP7SxGU2V1mUBgilZLeYV4yeZ14BZrhZMIfBJYnTJJq7WkuMrcRgFr1
         OKuP81Fg+rV6b4Cd+lKiONw8rH8iYfgOzbHXE0O4dMhyvhbw295yngbDTPBPHGvDGYYJ
         qoRA==
X-Forwarded-Encrypted: i=1; AJvYcCWeJItbeqHYdOPxRei81Zp4BrdO3kZzKyqRTZQdSwGZHlJfwdqD2MyABA64hTkF+47/7pgc35KG71k+Ak5ZyuYiYfgrXDJ8KSAwvnYXq6OSlyRx
X-Gm-Message-State: AOJu0Yw8BraaaI5WpGwgs4L+y3VthVchPXfdKzE+DMifm2hgnWn2AbkO
	vdGqJOoXUcfe5FxcIflxGtrmPbvpNfbQ48iJ1nEyZasvUiVrCupn
X-Google-Smtp-Source: AGHT+IEOfTMldWJhfu6oE3jsE+ovd09HiMqJ50xG/cVQ1nKISjkL9wPBGCmp2S8krtzhzoEZy2hTyA==
X-Received: by 2002:a05:6820:f49:b0:5bb:815d:e2ab with SMTP id 006d021491bc7-5bb815de308mr3532229eaf.1.1718247829399;
        Wed, 12 Jun 2024 20:03:49 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:48 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 30/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_amsdu_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:24 -0700
Message-Id: <20240613030241.5771-31-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200351_057475_6BC1570E 
X-CRM114-Status: GOOD (  12.22  )
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

Extend mt7925_mcu_sta_amsdu_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a57620aed63b..57b89eca4e21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1467,9 +1467,11 @@ mt7925_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 
 static void
 mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
-			 struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+			 struct ieee80211_vif *vif,
+			 struct ieee80211_link_sta *link_sta)
 {
-	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+	struct mt792x_link_sta *mlink;
 	struct sta_rec_amsdu *amsdu;
 	struct tlv *tlv;
 
@@ -1477,16 +1479,18 @@ mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 	    vif->type != NL80211_IFTYPE_AP)
 		return;
 
-	if (!sta->deflink.agg.max_amsdu_len)
+	if (!link_sta->agg.max_amsdu_len)
 		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HW_AMSDU, sizeof(*amsdu));
 	amsdu = (struct sta_rec_amsdu *)tlv;
 	amsdu->max_amsdu_num = 8;
 	amsdu->amsdu_en = true;
-	msta->deflink.wcid.amsdu = true;
 
-	switch (sta->deflink.agg.max_amsdu_len) {
+	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	mlink->wcid.amsdu = true;
+
+	switch (link_sta->agg.max_amsdu_len) {
 	case IEEE80211_MAX_MPDU_LEN_VHT_11454:
 		amsdu->max_mpdu_size =
 			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454;
@@ -1639,7 +1643,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta->sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta->sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
-- 
2.34.1


