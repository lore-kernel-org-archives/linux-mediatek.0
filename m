Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37175C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hABRQwLJLR6OxmMGgOk958a22tboZU2bLLZXApf8UgE=; b=LyLxnb0L6XoSc6ce6neEpZQyK8
	NrcLuz09hJZDS8XDSZVBUfEy3A9SkHxOaFR8eHBaVOyqZOoOiS7HNntfi1TsbTFTq07hTGhU9EMvr
	xcXVTouLF92MRh0K6If9OJJ4j2WG3nDpGn0pDDuVjgDixV+UDhkWmfMvd3Qs+lmjbLZHxcqnVIF/x
	/Pee+OHd33mlXdi1bv3fgy8lyyB0frKDHsq2Hmm7VBItsxLTHIGhPPQIcbLzC6vBHOcIr+1OMJanR
	HmZyohHLDZheuM/7limze8wUhF/FlwgbVcPfuZC/0uViuRSfJBE+06TEW41CFBXEebLh0zwn3Qnzh
	SM8w6fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nF-0000000HYFQ-3ZoT;
	Sat, 06 Jul 2024 08:29:17 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nC-0000000HYCu-3lTf
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:16 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25e55d0f551so42865fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254553; x=1720859353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hABRQwLJLR6OxmMGgOk958a22tboZU2bLLZXApf8UgE=;
        b=iQmVBedR/Q9L05OSDCgbLv/iG8oVi5i75PYxosa1wzC83isUjmFSRDpcKtjaCn5f/H
         IU3PLpp6NhkqJ6nufQdDCKlE+oWX9xJUu19xQM+7OMg07ySBcQx77Kpo4Tv6gu7uBiNx
         fYT69eLk8sjsaPqy+PnRxfe2fIpQ9/6F4AvPA3gRHX93P7clVSADj77fSL8wNs9uB7Fn
         UQVCAI9ca7XWA86Vx95tXSzXLapQ5uSEQEJhNdzcP2fVfBDFJibboV3fguLPkir3Sk/o
         Ze+upkbR7OPsQL3cbJOd0JcKyDz9qJDD4EVfLdy9s0yu0U/P89/qW4863I+AZHb4QI/Y
         hJFw==
X-Forwarded-Encrypted: i=1; AJvYcCUy9sReTOp8rS7R0ZhFar9MLitXSV2RbH8EsnK3yBWv5cE5sSyLUQK5azJOhS+sm4wtw/Dc2u5M+MRBwU9xLFFNgJGIskH3RtEdZ7F57U8EFuW7
X-Gm-Message-State: AOJu0YxLkVjveUY56aqWJswagcV1JvHEaBwtWTRQzXqJMvkwTJm4SbFe
	4JGe1pJlH50rUpWXQU1liKjs5bZ9DZ2dS7uF0NjJL+jokobUODfF
X-Google-Smtp-Source: AGHT+IFbH1Z2sSHmb2omoEiomfyOO8eR3oNEtCF75T2ElymMwSNPbM/yn0qrjMfkgoAwNd6Jb3/cMA==
X-Received: by 2002:a05:6870:b52a:b0:254:d417:34ff with SMTP id 586e51a60fabf-25e2bfedaafmr5497019fac.4.1720254553490;
        Sat, 06 Jul 2024 01:29:13 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:12 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 30/37] wifi: mt76: mt7925: add mt7925_mcu_sta_eht_mld_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:10 -0700
Message-Id: <a1001592eeef4e4ee2c3e15dc94cca0815d64e59.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012915_028219_3651D9C9 
X-CRM114-Status: GOOD (  12.97  )
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

add mt7925_mcu_sta_eht_mld_tlv for the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 42 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 11 +++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9329c959674f..d6882c9fd6bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -820,6 +820,7 @@ enum {
 	STA_REC_HE_6G = 0x17,
 	STA_REC_HE_V2 = 0x19,
 	STA_REC_MLD = 0x20,
+	STA_REC_EHT_MLD = 0x21,
 	STA_REC_EHT = 0x22,
 	STA_REC_MLD_OFF = 0x23,
 	STA_REC_REMOVE = 0x25,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 28e974195be7..e6e57d11daf6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1738,6 +1738,42 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 		       HT_MCS_MASK_NUM);
 }
 
+static void
+mt7925_mcu_sta_eht_mld_tlv(struct sk_buff *skb,
+			   struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct wiphy *wiphy = mvif->phy->mt76->hw->wiphy;
+	const struct wiphy_iftype_ext_capab *ext_capa;
+	struct sta_rec_eht_mld *eht_mld;
+	struct tlv *tlv;
+	u16 eml_cap;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_EHT_MLD, sizeof(*eht_mld));
+	eht_mld = (struct sta_rec_eht_mld *)tlv;
+	eht_mld->mld_type = 0xff;
+
+	if (!ieee80211_vif_is_mld(vif))
+		return;
+
+	ext_capa = cfg80211_get_iftype_ext_capa(wiphy,
+						ieee80211_vif_type_p2p(vif));
+	if (!ext_capa)
+		return;
+
+	eml_cap = (vif->cfg.eml_cap & (IEEE80211_EML_CAP_EMLSR_SUPP |
+				       IEEE80211_EML_CAP_TRANSITION_TIMEOUT)) |
+		  (ext_capa->eml_capabilities & (IEEE80211_EML_CAP_EMLSR_PADDING_DELAY |
+						IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY));
+
+	if (eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP) {
+		eht_mld->eml_cap[0] = u16_get_bits(eml_cap, GENMASK(7, 0));
+		eht_mld->eml_cap[1] = u16_get_bits(eml_cap, GENMASK(15, 8));
+	} else {
+		eht_mld->str_cap[0] = BIT(1);
+	}
+}
+
 static void
 mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
@@ -1858,8 +1894,12 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
 					    info->vif, info->rcpi,
 					    info->state);
-		if (info->state != MT76_STA_INFO_STATE_NONE)
+
+		if (info->state != MT76_STA_INFO_STATE_NONE) {
 			mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
+			mt7925_mcu_sta_eht_mld_tlv(skb, info->vif, info->link_sta->sta);
+		}
+
 		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index a97e5b539ab9..ac53bdc99332 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -443,6 +443,17 @@ struct sta_rec_mld {
 	} __packed link[2];
 } __packed;
 
+struct sta_rec_eht_mld {
+	__le16 tag;
+	__le16 len;
+	u8 nsep;
+	u8 mld_type;
+	u8 __rsv1[1];
+	u8 str_cap[3];
+	u8 eml_cap[3];
+	u8 __rsv2[3];
+} __packed;
+
 struct bss_ifs_time_tlv {
 	__le16 tag;
 	__le16 len;
-- 
2.25.1


