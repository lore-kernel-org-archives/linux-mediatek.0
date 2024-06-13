Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57F0C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQSrmyJur9VJtGLBvyCZFOXsDoRyiS3K1mbJIGVLmGY=; b=mOSQev5iSdvda2zqZK86MPCVRO
	2d4HgRQHgjDXgYJkPd/8jo3p76Kx8W2QT/RnJUNa/4JmI0x2GSiRolZwzEGMFC8Cv41tskEhS26w8
	9U3nFTeaVZ6Y5WcJoaJsx0iaikrJQggAnaTx7dC3Hk/D/MbYEMFKG5mluTVGutca8EZ0TLyGl/NsR
	PAW2Q79kaulXyhLuFxUCwzPKSMr3xem//JjTnvg/ocuvrUnqkYzHmX1zAIQPDe/bNWZjn1KPh8eJh
	sfOvlGbNoGR00KuUSbJxQXo7zSz5EjcCMH5h+wtAcq2JnoeXpPKZVlhAGtXqpV0v6gjkwWYG0vJnd
	20R0Aw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakg-0000000Ew2R-29bU;
	Thu, 13 Jun 2024 03:03:50 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakb-0000000EvyY-1zV9
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:48 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b97f09cde3so43146eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247824; x=1718852624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQSrmyJur9VJtGLBvyCZFOXsDoRyiS3K1mbJIGVLmGY=;
        b=IXsPWF5lRROcGpRw0iquRLmpFxcmaNHIfD44Xa7KTqQecLH61LzlUR/3d63nfVNCv1
         RhzeWBCPHfwHtsjPg5POoJqWk/+iXUDo6cIQn9HazlJXxfBvOUXUqrt1LelQD5pgwlty
         uwbrQtUcXUrrGKnXTu1AyqAJNMtAvojDWwlXjVkSApl7VgKs9SPLMfVulH96o3qcXv32
         VuwUsLI+1jaElp4NAMYcY5Ex96ja7mONsp5yN3yrpwF+qohZlR8YGM0cz/IRWWKnPwY+
         Wb86Gnh9tHxo7HUbeWCJQWmNM5vrrVHBvfElZw5TKj6w+8hZ9sI+FgXBc+y//NrOK6FH
         szYA==
X-Forwarded-Encrypted: i=1; AJvYcCVwEGHSBgN4AMZjzHyS7HJg1vMzAlYr/yxjy2sD1PsLXbEuaPyL5fM9/NlXueAS+xC/1lKj0dHTdSAonGxiSDneNJu9ls2JhLrpqY5WZVRB/h69
X-Gm-Message-State: AOJu0YxyzVqsbc1kou/12bgcbWNx5ZsioA/zY4ZLRPLHjtbEdtZ0eiBG
	bnXTShRvvW2yWjRm48KQTW3BACOMJDGLCDqM8KVTmC8IkIxD/c70
X-Google-Smtp-Source: AGHT+IEQwqpW1E/BUpJ0H742faaHw0baC1m9x6eKJRhLlzj4oh0zMKhrV7eM1ZIuaJf1+DJyS56xTQ==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr286160eaf.1.1718247823766;
        Wed, 12 Jun 2024 20:03:43 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:42 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 27/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_eht_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:21 -0700
Message-Id: <20240613030241.5771-28-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200345_635685_B7327EA0 
X-CRM114-Status: GOOD (  11.86  )
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

Extend mt7925_mcu_sta_eht_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 266010c0e00a..0c9cebd3ee71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1404,18 +1404,18 @@ mt7925_mcu_sta_he_6g_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 
 static void
-mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 {
 	struct ieee80211_eht_mcs_nss_supp *mcs_map;
 	struct ieee80211_eht_cap_elem_fixed *elem;
 	struct sta_rec_eht *eht;
 	struct tlv *tlv;
 
-	if (!sta->deflink.eht_cap.has_eht)
+	if (!link_sta->eht_cap.has_eht)
 		return;
 
-	mcs_map = &sta->deflink.eht_cap.eht_mcs_nss_supp;
-	elem = &sta->deflink.eht_cap.eht_cap_elem;
+	mcs_map = &link_sta->eht_cap.eht_mcs_nss_supp;
+	elem = &link_sta->eht_cap.eht_cap_elem;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_EHT, sizeof(*eht));
 
@@ -1425,7 +1425,7 @@ mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	eht->phy_cap = cpu_to_le64(*(u64 *)elem->phy_cap_info);
 	eht->phy_cap_ext = cpu_to_le64(elem->phy_cap_info[8]);
 
-	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_20)
+	if (link_sta->bandwidth == IEEE80211_STA_RX_BW_20)
 		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz, sizeof(eht->mcs_map_bw20));
 	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
 	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
@@ -1641,7 +1641,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_he_tlv(skb, info->link_sta->sta);
 		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta->sta);
-		mt7925_mcu_sta_eht_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
 					     info->link_sta);
 		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
-- 
2.34.1


