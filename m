Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D7C27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nye+j/7qGy0YUA+JVCM3jZJLUrkoBzYEWb5GNp1RVTA=; b=Oa6kSH3agD3eg9uHKD+Ld07d7s
	YKnGr1Ds4Jaqlf2eum37vMJachLOKfZP+vne/oxOazMNU6A7zDg+fEkUUlB63mg5IR1+RwM1zrv+6
	0IQM1uPr0vbxKvnNDcWgnIb8SHr1eBRFhRb6CFYQPzsm36vh/FrXXObY1XuYYhOo37GG77Hw55CpV
	YalE3W7YAxaDjlCjvXTKvhXBjMqH0/QLXNr4RjryAC5cdGLuSizs0Dk84xTADY2zgQYRQfrH9Ot5Z
	JMMva/h27tu+qxZU4gRkLFVAMScwQ+Jpt76kRcToatb3O2b4QQIpFQJQr362MHIIg5YCKXtTl4bVf
	hU9vmuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaks-0000000EwAN-2xIC;
	Thu, 13 Jun 2024 03:04:02 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakm-0000000Ew6O-49ox
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:59 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d21c5b48f5so75220b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247836; x=1718852636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nye+j/7qGy0YUA+JVCM3jZJLUrkoBzYEWb5GNp1RVTA=;
        b=iiYVUGaZkFsIJgcmSPDH1Qwl69y0mXE7e9Pa6DnjdQ/WEcew6ljcAc0VNlzy+LwsBL
         RJNVVDWzjfFftrcoh4pVXpcnu4QHqovARPfy/hZITAOO4PoMEyYgMMZI2MofpshadCcM
         851N98FFXwUrQYbaCxiSBG71vseeMludmBNVuWJcNO3TPZYwJN51XUlaA3+1eV/cmu8y
         ck5PJN5kQ0XR9pKUNC+2OEmjGLdGGvb6OrmgXXT2UvOokuimedCECE1IDD+hGb+uwG0F
         lCpv6iYhz+JC62380bajZPqkvvjT3U8twD/nY6jIak976NT0iPsEdQBf52C0GMk+SX/S
         FGfg==
X-Forwarded-Encrypted: i=1; AJvYcCUgJNvHZQaOuCGnv4mupZ8SMtZx8jbfwGaIr0bNy0SgefpMMkryRtT2LsGhktJ+M3CqvQ/XJkoFwcPtoIIxo7kR7zL+IV3hlMjFXj11+LEQlIwT
X-Gm-Message-State: AOJu0YyEsYLNoDgFbozUWBCLKL3gX2jm9tu0ZFFaK2PiKPvlOvlFyRB7
	/s2mm65Oc3+qgqBiTp2SiAdSHait8CWArjyD2d4mDsuKbTgayB89
X-Google-Smtp-Source: AGHT+IGqVf629ydu9/AlFHfkI+1bnq4OcapyfrCu+zhwMgh2RiZt82PM5g9cxvOIWlbsU+N3cPN4Bg==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3672840eaf.0.1718247835702;
        Wed, 12 Jun 2024 20:03:55 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:54 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 33/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_phy_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:27 -0700
Message-Id: <20240613030241.5771-34-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200357_062474_C4950BD1 
X-CRM114-Status: GOOD (  12.44  )
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

Extend mt7925_mcu_sta_phy_tlv with per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 35 ++++++++++++-------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 66d45d676739..a0fd02dd9551 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1507,34 +1507,43 @@ mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 
 static void
 mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
-		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+		       struct ieee80211_vif *vif,
+		       struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct cfg80211_chan_def *chandef = &mvif->bss_conf.mt76.ctx->def;
+	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def *chandef;
+	struct mt792x_bss_conf *mconf;
 	struct sta_rec_phy *phy;
 	struct tlv *tlv;
 	u8 af = 0, mm = 0;
 
+	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
+	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+	chandef = &mconf->mt76.ctx->def;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
 	phy = (struct sta_rec_phy *)tlv;
-	phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif, chandef->chan->band, sta);
-	phy->basic_rate = cpu_to_le16((u16)vif->bss_conf.basic_rates);
-	if (sta->deflink.ht_cap.ht_supported) {
-		af = sta->deflink.ht_cap.ampdu_factor;
-		mm = sta->deflink.ht_cap.ampdu_density;
+	phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
+						    chandef->chan->band,
+						    link_sta->sta);
+	phy->basic_rate = cpu_to_le16((u16)link_conf->basic_rates);
+	if (link_sta->ht_cap.ht_supported) {
+		af = link_sta->ht_cap.ampdu_factor;
+		mm = link_sta->ht_cap.ampdu_density;
 	}
 
-	if (sta->deflink.vht_cap.vht_supported) {
+	if (link_sta->vht_cap.vht_supported) {
 		u8 vht_af = FIELD_GET(IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK,
-				      sta->deflink.vht_cap.cap);
+				      link_sta->vht_cap.cap);
 
 		af = max_t(u8, af, vht_af);
 	}
 
-	if (sta->deflink.he_6ghz_capa.capa) {
-		af = le16_get_bits(sta->deflink.he_6ghz_capa.capa,
+	if (link_sta->he_6ghz_capa.capa) {
+		af = le16_get_bits(link_sta->he_6ghz_capa.capa,
 				   IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP);
-		mm = le16_get_bits(sta->deflink.he_6ghz_capa.capa,
+		mm = le16_get_bits(link_sta->he_6ghz_capa.capa,
 				   IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START);
 	}
 
@@ -1639,7 +1648,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 					      info->link_sta->sta,
 					      info->enable, info->newly);
 	if (info->link_sta && info->enable) {
-		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
-- 
2.34.1


