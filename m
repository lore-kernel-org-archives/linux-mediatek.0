Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF5C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvAGAozLAf9+Dd5l/jq2X8brfnVJfxZN/757XdNNGMA=; b=uHS4WduShmlJzwcUOSciXb1PiA
	r+IUgBeLRv38Qflhx/cWoDgp357pH73uxSrqRu/rj6ZYXFK4g1AHAZAffkdfQEZe52UFaF9U1ahIN
	Xk7k3UHduS5PEKu2oySjSGDnmplpDcLgoH/X4fBgVG8oCDCjNamFPAm+S5AeNHjhCRBXCCbBz7T5G
	UL4ZPFryY9KNex0bYn2EWcmHOUwDrUvnW10EeLEscQPWYlqNIclijfPq9ILfN/b4nTUAfEFtD6GUW
	zDRKHN5CxxmzESIIRiBVkxnDPdLm3o0dvO7O/gkDa/uiAnHS5r194oRJqs/FnBeLpimhXjytjwiQl
	S2uMd5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHake-0000000Ew1J-3UlT;
	Thu, 13 Jun 2024 03:03:48 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakZ-0000000EvxT-0a01
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:45 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d21a80b8ceso76358b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247822; x=1718852622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvAGAozLAf9+Dd5l/jq2X8brfnVJfxZN/757XdNNGMA=;
        b=uSaELGjBdX8TZBxWrA5NDqlVX3Hff0BpFK1IaZpxf8M56B80Zoc7M8Rnytfu/MlyLQ
         gjeKhygxbnrsVjvuk1ypQiIkrFxlmkyK1aKjmogFHkZBxdTENLEgqekB+96YSoBMhyh6
         csvv87dHzGw58bZROXcTMg0aN17dce+omA3FoX3aT6YgAs88dFyDE67ktwq7kPyICGxY
         pKB1NjybWsXdlGTF43HkykFQ11y4MQ1wifnYm4yzn+pJAE0b5QdnWItBN9aKp3Mm5FCM
         9a06sZEwOW9mYAd7I4h5ql4h3O+nwboq1Brah/fKsXFiKtsABTdtvE9wIsiPoI2LzSy9
         H9Og==
X-Forwarded-Encrypted: i=1; AJvYcCVLNh1vglc3fK+QTeAF8VwbLMcAbPV+rtYjQQzpAk30uxkXov3SDT5I6Sztui9Z7ypaXcHsXmUUhA+NYHstsWCCXXt+FLO77FYlkqfYf1FJOoz7
X-Gm-Message-State: AOJu0YyCT7oQruW+MeHJPqPiK6blKLzQG6mXWgATi9qSQXv9RKXmIOZy
	boo5J3IlWb7CmCWKPadEBQlzEPLH2cCQleoKC4HP7j37EQONQzf1
X-Google-Smtp-Source: AGHT+IGpMQ5S/mhrKCSARUVCIn4Jo9kDC1V91P56i1wTQJz8siUBroHJtRJ4cj+F8W+b4BJC3NgdeA==
X-Received: by 2002:a05:6820:f49:b0:5bb:815d:e2ab with SMTP id 006d021491bc7-5bb815de308mr3531966eaf.1.1718247821798;
        Wed, 12 Jun 2024 20:03:41 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:40 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 26/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_rate_ctrl_tlv with per-link STA
Date: Wed, 12 Jun 2024 20:02:20 -0700
Message-Id: <20240613030241.5771-27-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200343_262486_3193B547 
X-CRM114-Status: GOOD (  12.31  )
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

Extend mt7925_mcu_sta_rate_ctrl_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 45437603763e..266010c0e00a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1569,7 +1569,8 @@ mt7925_mcu_sta_state_v2_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 
 static void
 mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
-			     struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+			     struct ieee80211_vif *vif,
+			     struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct cfg80211_chan_def *chandef = &mvif->bss_conf.mt76.ctx->def;
@@ -1581,7 +1582,7 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA, sizeof(*ra_info));
 	ra_info = (struct sta_rec_ra_info *)tlv;
 
-	supp_rates = sta->deflink.supp_rates[band];
+	supp_rates = link_sta->supp_rates[band];
 	if (band == NL80211_BAND_2GHZ)
 		supp_rates = FIELD_PREP(RA_LEGACY_OFDM, supp_rates >> 4) |
 			     FIELD_PREP(RA_LEGACY_CCK, supp_rates & 0xf);
@@ -1590,9 +1591,9 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 
 	ra_info->legacy = cpu_to_le16(supp_rates);
 
-	if (sta->deflink.ht_cap.ht_supported)
+	if (link_sta->ht_cap.ht_supported)
 		memcpy(ra_info->rx_mcs_bitmask,
-		       sta->deflink.ht_cap.mcs.rx_mask,
+		       link_sta->ht_cap.mcs.rx_mask,
 		       HT_MCS_MASK_NUM);
 }
 
@@ -1642,7 +1643,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta->sta);
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta->sta);
 		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
-					     info->link_sta->sta);
+					     info->link_sta);
 		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
 					    info->vif, info->rcpi,
 					    info->state);
-- 
2.34.1


