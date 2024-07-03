Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069EBC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zm2u2GDuUR87ImOZGiIFmMyIIv/8lErTyscfyIFe+M=; b=un9mj4WfsuKHTTCwgKxY7Yr63V
	pUgeb0z/iDT7y1bKK1Erv10vLawN2VZlHvH57NqXWwtdE14gJL/m6t/aulmP6IqFc3iJX+ZI4t3ZT
	pzVj1jdVG99jMOgr9uEhC0BXdXWDh4PmzsxrrAo5z/7YRFAcWQ8VadsGBQupI/Zl0eWnx7l7cER23
	fq/hRGkied7VkzXTnEQH4uu8uUse0eGUhTzlNN+wjQY6/INgXDWlayvWK2eQpCIx0MoTPrQAsiJkm
	4rj6wk5QDaLFRxsqJs+6UDQEwjt7o3dpzEW5Wf9gLAZK3S1fkPziu1J2F8fLFEoFBWBA7kJ3K2men
	kS2pdQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lV-0000000BXTU-2dvF;
	Wed, 03 Jul 2024 21:43:49 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lT-0000000BXRl-0SEq
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:48 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70228a1af2eso45434a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043026; x=1720647826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Zm2u2GDuUR87ImOZGiIFmMyIIv/8lErTyscfyIFe+M=;
        b=RWHmAZnv3R+RU+G1XEEDAWHkwLM4rzVd/xgX28Foow/wlHFOY4AcuLcFn/0QwcF6/j
         qJMQ7ztp/C7P1KITjpdytUdxzFpLJ1vZEklXikBZgjkPlki7R1rCrDj9QOgKCpZsT4xk
         K0yPc/7izV16Sy8rmBvmWXde2GJPnVT0wzm4yA51en2DMxCgXrI2WAzp6MQEC67TVt9Z
         FAEsL/88ympcJ8JZl4BsP4bbi0dUS4u4H8xuUSbIeBXCoohr7Dx2klAAIwYH2u5zu3e6
         T4BiN/JrQWN8p/qpuP3cwgzWbpBseOoJgFkFO6esWkXAlf6xVhSN4RiJ3HkzhC4Rsuq/
         S+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcFt7WJ+dLo4DvbDs8QQwd+FaQREkzwpHO8SdA8Xqqg+gt1yPaoAgvvAbmxZl2EVvDFe+xbcghCertArhUZQqX3UEQOR2bcQbBr2c4DiEPllzq
X-Gm-Message-State: AOJu0YyORnKMB1UvcXSz94u4pOZUNyibz3rTsucpAonZ1XL1sTYMnWaY
	T7b6PETYOIAVBh/Jdhq9MLFfjdzI+plXehZRYXiF3W9OLm2FL90A
X-Google-Smtp-Source: AGHT+IHOSLauwODbtAedsub0S622gbphfmI+pOTqu9GNMm9cAI1Tx7iKjETXO6xlPoYg3paWmDA2LQ==
X-Received: by 2002:a9d:65c5:0:b0:700:ca13:30bc with SMTP id 46e09a7af769-70207763b58mr13703603a34.2.1720043026332;
        Wed, 03 Jul 2024 14:43:46 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:44 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 27/29] wifi: mt76: mt7925: add mt7925_mcu_sta_eht_mld_tlv for MLO
Date: Wed,  3 Jul 2024 14:42:32 -0700
Message-Id: <a561004e6894a7b68166c25c0bf4b6ecf48fc2b7.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144347_180467_5BFE5F7A 
X-CRM114-Status: GOOD (  13.04  )
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
index dcb8c506543b..36ddc64ed7d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1731,6 +1731,42 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
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
@@ -1848,8 +1884,12 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
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
index 8a0196699230..5703176056db 100644
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


